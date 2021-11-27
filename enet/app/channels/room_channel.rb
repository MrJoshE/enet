class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find params[:room_id]
    stream_for room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create(data)
    Message.create! content: data['message'], user: current_user
  end
end