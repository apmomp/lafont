# encoding: utf-8

class SessionsController < ApplicationController
  skip_before_filter :authenticate, :only => [:new, :create]
  
  def new
    @title = "Entrar"
  end

  def create
    user = User.authenticate(params[:session][:nick],
                            params[:session][:password])
    if user.nil?
      flash.now[:error] = "El nombre de usuario y/o la contraseña no es válido"
      @title = "Entrar"
      render :new      
    else
      sign_in user
      redirect_back_or root_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
