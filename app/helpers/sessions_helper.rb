module SessionsHelper

    def current_user
        if session[:user_id]
            current_user = User.find(session[:user_id])

=begin
        elsif cookies[:user_id]

            @user = User.find(cookies[:user_id])

            if @user && BCrypt::Password.new(@user.remember_digest).is_password?(cookies[:remember_token])
                session[:user_id] = @user.id
                current_user = @user
            end
=end
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        unless logged_in?
            redirect_to new_session_path, alert: "Please log in"
        end
    end

end