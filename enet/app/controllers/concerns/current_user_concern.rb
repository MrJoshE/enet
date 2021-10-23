module CurrentUserConcern extend ActiveSupport::Concern

    # This means that when the CurrentUserConcern is used
    # before any action is made check that the current
    # user is logged in / there is a current user in the 
    # session
    include do
        before_action :set_current_user
    end

    # method that will check if there is a current user 
    # in the session
    def set_current_user
        # checks if there is a user_id stored in the session
        if (session['user_id'])
            # sets the @current_user variable to the user
            # with that id so that it can be used by any 
            # controller with this CurrentUserConcern 
            @current_user = User.find(session['user_id'])
        end
    end

end