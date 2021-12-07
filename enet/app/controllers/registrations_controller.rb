# This controller will be responsible for managing the registration
# of users
class RegistrationsController < ApplicationController

    def initialize
        super
    end

    def index
        # We want to load all of the modules from the university_modules table when the page loads
        # so that the user can see these modules in a dropdown list and can select the modules that they are
        # taking from that list.
        @available_modules = UniversityModule.all
    end

    def create
        modules = params['modules']
        if !modules || modules.empty?
            flash[:error] = "You must select at least one module"
            respond_to do |format|
                format.json {
                    render json: {
                      status: 400,
                      reason: "You must select at least one module."
                    }
                }
                format.html {
                    render html: {
                      status: 400,
                      reason: "That email address is already in use, Please use another."
                    }
                }
            end
            return
        end
        begin
            # Check to see if there is a user that already has the email that the user is
            # trying to register with
            existing_user = User.where( email: params['email'] ).first

            # If the email is currently in use (another enet account is assigned to that email)
            # we want to respond to the client with an error that tells them that the email
            # address is already in use so their account cannot be created.
            if existing_user != nil
                flash[:error] = "The email address you have entered is already in use. Please try another email address."
                respond_to do |format|
                    format.json {
                        render json: {
                            status: 400,
                            reason: "That email address is already in use, Please use another."
                        }
                    }
                    format.html {
                        render html: {
                          status: 400,
                          reason: "That email address is already in use, Please use another."
                        }
                    }
                end


                return
            else

            end


            # create a user object with the registration params and assign it to the user variable.
            # If the creation of the user fails then an error is thrown (which will be caught in the rescue)
            user = User.create!(user_params)

            # if the user was successfully created ...
            # create a list of user_modules that will be created for this user so that
            # when we are in the dashboard we can pull the modules for a given user.
            user_modules = []
            modules.each do |module_id|
                user_modules.push({
                                    user_id: user.id,
                                    module_id: module_id
                                  })
            end

            # need to create a new entry in the user_modules table for each of the modules that the user
            # has selected on registration and assign then to this user.
            UserModule.create(user_modules)

            # put the users id in the session so they stay logged in for this browser session
            session[:user_id] = user.id

            # send a response back to the client with a redirect status and redirect_to of the dashboard
            # so they navigate to the dashboard now they are logged in.
            respond_to do |format|
                format.json {
                    render json: {
                      status: 302,
                      reason: 'Account has been created successfully.',
                      location: '/dashboard'
                    }
                }
                format.html { redirect_to '/dashboard', status: 302 }
            end

        # if the somewhere here throws an error then we will catch the error instead of letting it crash
        # and log this in the console and send a message back to the client that they will not be able to register
        # and the error is outputted in the console.
        rescue => e
            puts e
            respond_to do |format|
                format.json {
                    render json: {
                      status: 500,
                      reason: "We were unable to create your account. "
                    }
                }
                format.html {
                    render html: {
                      status: 500,
                      reason: 'There was an unknown error when creating your account.'
                    }
                }
            end
        end
    end

    private
    def user_params
        params.permit(:email, :password, :password_confirmation, :modules)
    end
end