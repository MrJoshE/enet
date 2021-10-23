# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


* What has been added to the base ruby server

**Cors**

cors is a package that allows us to whitelist certain domains as we are going to be passing secure cookies between the backend and the front end. To do this we need to be able to use a tool 'credentials' which then allows us to set some 'rules' to define how we are going to communicate which is defined in the `config/initializers/cors.rb`