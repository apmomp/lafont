# encoding: utf-8

module SessionsHelper
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    current_user = user
  end

  def sign_out
    cookies.delete(:remember_token)
    current_user = nil
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user?(user)
    user == current_user
  end

  def deny_access
    store_location(nil)
    redirect_to signin_path, :notice => "Por favor, haz login para acceder al sistema"
  end

  def authenticate
    deny_access unless signed_in?
  end

  def redirect_back_or(default)
    redirect_to (session[:return_to] || default)
    clear_return_to
  end

  def admin_user
    if not current_user.admin?
      flash[:notice] = "Acceso no permitido"
      redirect_to root_path
    end
  end

  def banned_user
    ban = current_user.bans.where("ends_at > ?", Time.now).first
    flash[:notice] = "You are banned until " + (ban.ends_at.to_date.to_s)  + "!" unless ban.nil?

    ban = current_user.bans.where("ends_at IS NULL").first
    flash[:notice] = "You are banned forever!" unless ban.nil?

    redirect_to root_path unless flash[:notice].nil?
  end  

  private

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end

    def store_location(path)
      session[:return_to] = path || request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end

end

