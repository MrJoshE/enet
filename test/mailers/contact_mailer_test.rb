require "test_helper"

class ContactMailerTest < ActionMailer::TestCase
  test "new feedback email" do
    # Set up an order based on the fixture
    contact = contact(:one)

    # Set up an email using the order contents
    email = ContactMailer.with(contact).new_contact_email

    # Check if the email is sent
    assert_emails 1 do
      email.deliver_now
    end

    # Check the contents are correct
    assert_equal ['contact@enet.com'], email.from
    assert_equal ['contact@enet.com'], email.to
    assert_equal "New feedback from #{contact.email}" , email.subject
    assert_match contact.name, email.html_part.body.encoded
    assert_match contact.name, email.text_part.body.encoded
    assert_match contact.email, email.html_part.body.encoded
    assert_match contact.email, email.text_part.body.encoded
    assert_match contact.message, email.html_part.body.encoded
    assert_match contact.message, email.text_part.body.encoded
  end
end
