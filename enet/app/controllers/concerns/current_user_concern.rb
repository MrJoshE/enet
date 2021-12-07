module CurrentUserConcern extend ActiveSupport::Concern

    # This means that when the CurrentUserConcern is used
    # before any action is made check that the current
    # user is logged in / there is a current user in the 
    # session
    included do
        before_action :set_current_user
    end

    # method that will set the current user instance variable to
    # the current user in the session if it exists
    def set_current_user
        # checks if there is a user_id stored in the session
        if session[:user_id]
            # sets the @current_user variable to the user
            # with that id so that it can be used by any
            # controller with this CurrentUserConcern
            @current_user = User.find(session[:user_id])
        end
        # @current_user = User.find(session[:user_id]) if session[:user_id]
    end

    # Performs a further check to make sure that the user is
    # actually logged in, useful for controllers that require
    # the user to be logged in for all of the routes.
    def auth_check
        unless @current_user
            redirect_to "/unauthorized?url=#{request.url}"
        end
    end

    # Gets a list of the university modules that the user is taking
    def users_modules
        user_module_ids = UserModule.where(user_id: @current_user.id).pluck(:module_id)
        UniversityModule.where(id: user_module_ids)
    end
    
    def log_in(user)
        session[:user_id] = user.id
    end

    # Checks whether the user is an admin so that we don't have normal users being 
    # able to perform actions that should be reserved for admins such as 
    # editing modules.
    def admin_check
        unless @current_user.is_admin
            redirect_to "/unauthorized?url=#{request.url}"
        end
    end

end