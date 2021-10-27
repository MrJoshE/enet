# This controller will be responsible for managing the registration
# of users
class RegistrationsController < ApplicationController

    def index

    end

    def create
        user = User.create!(
            email: params['email'],
            password: params['password'],
            password_confirmation: params['password_confirmation']
        )
        if (user)
            session[:user_id] = user.id
            render html:{
              status: 302,
              location: 'http://localhost:3000/dashboard'
            }
        else
            render json: {
                status: 500
            }
        end
    end
end