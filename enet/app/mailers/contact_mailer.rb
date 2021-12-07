class ContactMailer < ApplicationMailer

  def new_contact_email
    @contact = params
    mail(to: "contact@enet.com", subject: "New feedback from #{@contact.email}")
  end
end
