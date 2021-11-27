class RoomMessagesController < ApplicationController
  before_action :load

  # Creating a new message for the room, setting the user to the current user and message to be the
  # contents of the message field.
  def create
    @room_message = RoomMessage.create user: @current_user,
                                       room: @room,
                                       message: params.dig(:room_message, :message)
    #  broadcast that the message has been created
    ActionCable.server.broadcast 'rooms/' + @room.id.to_s , @room_message
  end

  protected
  # Preloading the room using the room_id from the params
  def load
    @room = Room.find params.dig(:room_message, :room_id)
  end

end
