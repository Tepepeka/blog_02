class UsersController < ApplicationController

    before_action :set_user, only: [:show]

    def show

    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.valid?
          @user.save
          session[:user_id] = @user.id

        remember_token = SecureRandom.urlsafe_base64
        @user.remember(remember_token)
        cookies.permanent[:user_id] = @user.id
        cookies.permanent[:remember_token] = remember_token
          
          redirect_to root_path, notice: "Welcome #{@user.name}"
        else
          render :new, status: :unprocessable_entity
        end
    end

    #######
    private
    #######

    def set_user
        @user=User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :age, :email, :password, :password_confirmation, :city_id)
    end

end