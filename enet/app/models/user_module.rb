class UserModule < ApplicationRecord

  # validate that when the entry is created there needs to be a user_id
  # and a module_id for each entry.
  validates_presence_of :user_id
  validates_presence_of :module_id

  has_one :user
  has_one :university_module

end