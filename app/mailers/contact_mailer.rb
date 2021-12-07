class ContactMailer < ApplicationMailer

  def new_contact_email
    @contact = params
    mail(from: 'contact@enet.com', to: "contact@enet.com", subject: "New feedback from #{@contact.email}")
  end
end
