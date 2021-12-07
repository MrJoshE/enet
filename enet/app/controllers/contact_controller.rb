class ContactController < ApplicationController

  include CurrentUserConcern

  def initialize
    super
  end

  def index
    @email = ""
    if @current_user
      @email = @current_user.email
    end
  end

  def create
    @contact = Contact.new(permit_params)
    if @contact.save!
      ContactMailer.with(@contact).new_contact_email.deliver_now
      render html: "<h1>Thank you for your message!</h1>".html_safe
    else
      render html: "<h1>Didn't work!</h1>".html_safe
    end

  end

  def permit_params
    params.permit( :email, :message)
  end
end