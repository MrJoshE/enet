module CurrentUserConcern extend ActiveSupport::Concern

    # This means that when the CurrentUserConcern is used
    # before any action is made check that the current
    # user is logged in / there is a current user in the 
    # session
    included do
        before_action :set_current_user
    end

    # method that will check if there is a current user 
    # in the session
    def set_current_user
        # checks if there is a user_id stored in the session
        if session[:user_id]
            # sets the @current_user variable to the user
            # with that id so that it can be used by any 
            # controller with this CurrentUserConcern 
            @current_user = User.find(session[:user_id])
        end
    end

    # Performs a further check to make sure that the user is
    # actually logged in, useful for controllers that require
    # the user to be logged in for all of the routes.
    def auth_check
        unless @current_user
            redirect_to "/unauthorized?url=#{request.url}"
        end
    end

    def log_in(user)
        session[:user_id] = user.id
    end

end