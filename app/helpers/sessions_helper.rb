module SessionsHelper

    def current_user
        if session[:user_id]
          @user = User.find(session[:user_id])
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