class RoomController:: ApplicationController

  def index
    @rooms = Rooms.public_rooms
  end
end