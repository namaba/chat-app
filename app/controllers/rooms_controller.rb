class RoomsController < ApplicationController
  before_action :set_user, only: %i[create]
  before_action :has_room?, only: %i[create]

  def index
    @rooms = Room.all.order(:id)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
  end

  def create
    @room = Room.new
    if @room.create_with_users_rooms(current_user, @user)
      redirect_to room_path(@room), notice: 'チャットルームが作成されました'
    else
      redirect_to root_path, alert: 'チャットルームの作成に失敗しました'
    end
  end

  private

  def set_user
    @user = User.find params[:user_id]
  end

  def has_room?
    room_id = current_user.rooms.ids & @user.rooms.ids
    redirect_to room_path(room_id[0]) if room_id.present?
  end
end
