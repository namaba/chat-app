class RoomsController < ApplicationController
  def index
    @rooms = Room.all.order(:id)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
  end

  def create
    @room = Room.build()
    # @room.room_users.build(user: current_user)
    # @room.room_users.build(user: params[:user_id])
  end
end
