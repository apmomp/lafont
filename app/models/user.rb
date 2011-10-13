class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation

  #belongs_to :user_tipo, :foreign_key => "tipo_id"
  belongs_to :tipo, :class_name => "UserTipo", :foreign_key => "tipo_id"

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  
  validates :name, :presence => true,
          :length => { :maximum => 50 }
  
  validates :email, :presence => true,
          :format => { :with => email_regex },
          :uniqueness => { :case_sensitive => false}
  
  validates :password, :presence => true, 
          :confirmation => true, 
          :length => { :within => 6..40 }
          
  before_save :encrypt_password 
  
  # Return true if the user's password matches the submitted password. 
  def has_password?(submitted_password) 
    # Compare encrypted_password with the encrypted version of 
    # submitted_password. 
    encrypted_password == encrypt(submitted_password)
  end 
  
  def self.authenticate(email, submitted_password) 
    user = find_by_email(email) 
    user && user.has_password?(submitted_password) ? user : nil
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end

  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end
  
  def formated_email
    "<#{self.email}>"
  end
 
  def feed
    Micropost.from_users_followed_by(self)
  end

  def banned?
    ban_values = { :is_banned => false, :ends_at => nil }
    
    ban = self.bans.where("ends_at > ?", Time.now).first
    
    if not ban.nil?
      ban_values[:is_banned] = true
      ban_values[:ends_at] = ban.ends_at
    end
 
    ban_values[:ends_at] = nil unless self.bans.where("ends_at IS NULL").empty?

    ban_values
  end
  
  private 
    def encrypt_password 
      self.salt = make_salt if new_record? 
      self.encrypted_password = encrypt(password) 
    end 
    
    def encrypt(string) 
      secure_hash("#{salt}--#{string}") 
    end 
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
