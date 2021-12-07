class Contact < ActiveRecord::Base
  validates_presence_of  :email, :message
  validates_format_of :email, :with => URI::MailTo::EMAIL_REGEXP
  validates_length_of :message, :maximum => 500
end