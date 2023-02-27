class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      # Create Cookie
      remember_token = SecureRandom.urlsafe_base64
      @user.remember(remember_token)
      cookies.permanent[:user_id] = @user.id
      cookies.permanent[:remember_token] = remember_token
      #puts "************************"
      #puts @user.inspect
      #puts cookies[:user_id]
      #puts cookies[:remember_token]
      #puts "************************"

      redirect_to root_path, notice: "#{@user.name} login"
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    puts params.inspect
    
    redirect_to root_path, notice: "logout"
  end

end