# encoding: utf-8

class UsersController < ApplicationController
  #before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  #before_filter :authenticate, :except => [:show, :new, :create]
  skip_before_filter :authenticate, :except => [:create, :new, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => [:create, :new, :destroy]
  #before_filter :logged_in, :only => [:create, :new]
  before_filter :delete_himself, :only => [:destroy]

  def new
    @user = User.new
    @title = "Registrar nuevo empleado..."
  end
  
  def show
    @user = User.find(params[:id])
    @title = @user.name

  end

  def index
    @users = User.paginate(:page => params[:page])
    @title = "Lista de empleados"

  end
  
  def create 
    @user = User.new(params[:user]) 
    if @user.save
      sign_in @user
      flash[:success] = "Bienvenido a La Font"
      redirect_to root_path
    else
      @user.password.clear
      @user.password_confirmation.clear 
      @title = "Sign up" 
      render :new 
    end 
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Usuario borrado"
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Perfil actualizado"
      redirect_to root_path
    else
      @title = "Edit user"
      render :edit
    end
  end

  private

    def correct_user
      @user = User.find(params[:id])
      if not current_user?(@user)
        flash[:notice] = "Acción no permitida..."
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
        flash[:notice] = "No te puedes eliminar a ti mismo"
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
