
# This code means we are inserting this level of middleware and all of the 
# rules that are placed here are going to be intercepted by the rails config
# so that if an application tries to communicate with this system that isn't 
# whitelisted in these rules we don't want to give them any access to the system.
Rails.application.config.middleware.insert_before 0, Rack::Cors do

    # Creating an allow block that allows incoming requests from the following 
    # domain for now this is just localhost which is this server.
    # We are allowing all resources from this domain and all headers, and the 
    # http methods that are listed below.
    # Credentials being set to true is what actually allows us to send the cookies 
    # from the front end app to the back end app.
    allow do
        origins 'http://localhost:3000'
        resource "*", headers: :any, methods: [:get, :post, :head, :delete], credentials: true
    end 

end