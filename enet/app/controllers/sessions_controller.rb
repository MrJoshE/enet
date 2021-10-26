class SessionsController < ApplicationController

    # Includes the CurrentUserConcern that checks to make sure that there is a
    # user in their session that is logged in
    include CurrentUserConcern

    # When sessions#create is called a post request will be sent 
    # and received here and this function will be run.
    def create
        # Lookup a user in the user table that has the email provided.
        # If there
        user = User
                .find_by(email: params['email'])
                .try(:authenticate, params['password'])

        # If finding the user by their email and authenticating them
        # with their password was success then set a cookie of the user_id
        # to the user id of the user that the session will be created for.
        # This is done so that we can associate the cookie with the current user.
        # To show that the session was created successfully we are sending a 
        # response with the user that was found.
        if user
            session[:user_id] = user.id
            render json:{
                status: :created,
                logged_in: true,
                user: user
            }
        # If there was no user in the database with the email provided or the email
        # provided doesn't match the users password then return a json response with 
        # the status 401 as this is the global status code for unauthorized.
        else
           render json:{
             logged_in: false,
                status: 401
            }
        end 

    end

    # Function that determines whether the user is logged in
    def logged_in
        # Checks that the session has a user_id and if so the @current_user
        # contains the User object that is associated with the id in the session
        if @current_user
            # send back a json response with the user that is logged in.
            render json:{
                logged_in: true,
                user: @current_user
            }
        # Execute if there is no user_id stored in the session
        else
            # Send a json response telling the caller that there is no user logged in.
            render json:{
                logged_in: false
            }
        end
    end

    # A function that resets the callers session and sends back a json response
    # telling the caller that the logout was successful.
    def logout
        reset_session
        render json: {
            status: 200, 
            logged_out: true
        }

    end

end