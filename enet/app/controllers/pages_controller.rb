# Will be the controller that manages the static routes static
# routes such as the about page and the contact us page.
class PagesController < ApplicationController
    include CurrentUserConcern



    def send_to_dashboard
        if @current_user
            redirect_to '/dashboard'
        end 
    end

    # The class constructor that allows us to create class wide variables.
    def initialize
        super
        @footer = 'This project was made as part of com2025 Coursework by Josh Everett'
    end

    # The page that the user will initially land on when they enter the website
    # this page will have a title, description and a button to login.
    def index
        send_to_dashboard
    end

    # The page that the users will goto if they want to know more about information about
    # the website and what is made for.
    def about
    end

    # The page that will tell the user how to contact the owner of the website
    # and for any support.
    def contact
        @email = ""
        if @current_user
            @email = @current_user.email
        end
    end

    # The page that the users will use to login with an existing account.
    def login
        send_to_dashboard
    end

    # The page that new users will use to create account that will be used
    # to login to and use the website.
    def signup
        send_to_dashboard
    end

    # The page that the user will be sent if they are unauthorized / are not
    # logged in
    def unauthorized
        @sender = params['url']
        if @sender
            @message = "The url #{@sender} requires you to log in. You are not authorized."
        else
            @message = "You are not authorized to complete this action please login and try again."
        end
    end


end
