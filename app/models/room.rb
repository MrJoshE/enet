class Room < ApplicationRecord
  # Telling the model that the room belongs to a university module
  belongs_to :university_module
  # Telling the model that the room has many room_messages
  has_many :room_messages, dependent: :destroy, inverse_of: :room
end
