# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  def new_contact_email
    contact = Contact.new(email: "testing@enet.com", message: "Feedback message")

    ContactMailer.with(contact).new_contact_email
  end

end
