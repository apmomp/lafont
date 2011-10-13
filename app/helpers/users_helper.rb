module UsersHelper
  def gravatar_for(user, options = { :size => 90 }) 
    gravatar_image_tag(user.email.downcase, :alt => "Avatar", 
    :class => 'gravatar', 
    :gravatar => options) 
  end

end
