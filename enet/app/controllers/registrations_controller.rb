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
        begin
            # create a user object and assign it to the user variable.
            user = User.create!(
                email: params['email'],
                password: params['password'],
                password_confirmation: params['password_confirmation']
            )


            # if the user was successfully created ...
            if user
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
                modules = UserModule.create(user_modules)

                # put the users id in the session so they stay logged in for this browser session
                session[:user_id] = user.id

                # send a response back to the client with a redirect status and redirect_to of the dashboard
                # so they navigate to the dashboard now they are logged in.
                respond_to do |format|
                    format.html {redirect_to 'http://localhost:3000/dashboard', status: 200}
                end
            else
                # if the user was not created successfully send a json response back to the client
                # with a status 500 and a reason that is stated below that will be alerted to the
                # user when they receive the response.
                respond_to do |format|
                    format.json {
                        render json: {
                          status: 500,
                          reason: 'There was an unknown error when creating your account.'
                        }
                    }
                end
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
                          reason: "We were unable to create your account. Please contact an Administrator"
                        }
                    }
                end
        end
    end
end