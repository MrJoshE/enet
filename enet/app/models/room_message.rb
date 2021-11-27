class RoomMessage < ApplicationRecord
  # Tells the model that it belongs to a room
  belongs_to :room, inverse_of: :room_messages
  # Tells the model that it belongs to a user
  belongs_to :user

end
