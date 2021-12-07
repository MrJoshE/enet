class RoomChannel < ApplicationCable::Channel


  def subscribed
    room = Room.find_by_id params[:room_id]
    stream_from 'rooms/' + room.id.to_s


  end


  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create(data)
    Message.create! content: data['message'], user: User.find(data['user_id'])
  end
end