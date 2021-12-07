class RoomsController < ApplicationController
  include CurrentUserConcern

  before_action :auth_check
  before_action :load

  def index
      module_ids = users_modules.pluck(:id)
      @rooms = Room.where(university_module_id: module_ids)
  end

  def new
    @room = Room.new
  end

  def create
    admin_check
    @room = Room.new permitted_parameters
    if @room.save
      redirect_to university_module_path(@room.university_module_id)
    else
      render :new
    end
  end

  def load
    module_ids = users_modules.pluck(:id)
    @rooms = Room.where(university_module_id: module_ids)
    if params[:id]
      @room = Room.find(params[:id])
    else
      @room = @rooms.first
    end

  end

  def permitted_parameters
    params.require(:room).permit(:name, :university_module_id)
  end

  def show
    @room_message = RoomMessage.new room: @room
    @room_messages = @room.room_messages.includes(:user)
  end


end
