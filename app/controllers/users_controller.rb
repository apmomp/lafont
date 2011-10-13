class UsersController < ApplicationController
  #before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => [:destroy]
  before_filter :logged_in, :only => [:create, :new]
  before_filter :delete_himself, :only => [:destroy]

  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
    @microposts = @user.microposts.paginate(:page => params[:page])
    @ban = User.find(params[:id]).bans.new
    flash_notice_ban(@user)
  end

  def index
    @users = User.paginate(:page => params[:page])
    @title = "All users"
  end
  
  def create 
    @user = User.new(params[:user]) 
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @user.password.clear
      @user.password_confirmation.clear 
      @title = "Sign up" 
      render :new 
    end 
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed"
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      @title = "Edit user"
      render :edit
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render :show_follow
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render :show_follow
  end

  private

    def correct_user
      @user = User.find(params[:id])
      if not current_user?(@user)
        flash[:notice] = "Forbidden accion..."
        redirect_to(root_path)
      end
    end

    def admin_user
      redirect_to root_path unless current_user.admin?
    end

    def logged_in
      redirect_to root_path unless not signed_in?
    end

    def delete_himself
      @user = User.find(params[:id])
      if current_user?(@user)
        redirect_to users_path
        flash[:notice] = "You can't delete yourself"
      end
    end

    def flash_notice_ban(user)
      ban = user.banned?
      if ban[:is_banned]
        flash[:notice] = user.name + " is banned"
        if not ban[:ends_at]
          flash[:notice].concat(" permanently!")
        else
          flash[:notice].concat(" until " + ban[:ends_at].to_date.to_s + "!")
        end
      end
    end 
  
end
