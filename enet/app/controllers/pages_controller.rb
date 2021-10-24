# Will be the controller that manages the static routes static
# routes such as the about page and the contact us page.
class PagesController < ApplicationController
    # The class constructor that allows us to create class wide variables.
    def initialize
        @footer = 'This project was made as part of com2025 Coursework by Josh Everett'
    end

    # The page that the user will initially land on when they enter the website
    # this page will have a title, description and a button to login.
    def index
        @title = 'Welcome to the EverNet'
        @description = 'An online dashboard that helps you find basic information about your modules.'
    end

    # The page that the users will goto if they want to know more about information about
    # the website and what is made for.
    def about
        @title = 'About'
        @description = 'Evernet is an online dashboard that allows users 
        to view basic information about their chosen modules. To use this 
        dashboard please press the home button and make sure that you are 
        signed in. Your selected modules should be visible onscreen.'
    end

    # The page that will tell the user how to contact the owner of the website
    # and for any support.
    def contact
        @title = 'Contact Us'
        @description = ''
    end

    # The page that the users will use to login with an existing account.
    def login
    end

    # The page that new users will use to create account that will be used
    # to login to and use the website.
    def signup
    end


end
