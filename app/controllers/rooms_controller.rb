class RoomsController < ApplicationController
  before_action :set_room, only: %i[show]
  before_action :set_user, only: %i[create]
  before_action :has_room?, only: %i[create]

  def index
    @rooms = current_user.rooms.order(:id)
  end

  def show
    @room.messages.where.not(user_id: current_user).update(is_read: true)
    deleted_messages = @room.messages.where(user_id: current_user, is_deleted: true)
    @messages = @room.messages.where.not(id: deleted_messages)
    @message_users = @room.users.where.not(id: current_user.id).pluck(:username).join(' ')
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

  def set_room
    @room = current_user.rooms.find_by(id: params[:id])
    redirect_to root_path, alert: '有効なチャットルームではありません' if @room.nil?
  end

  def set_user
    @user = User.find params[:user_id]
  end

  def has_room?
    room_id = current_user.rooms.ids & @user.rooms.ids
    redirect_to room_path(room_id[0]) if room_id.present?
  end
end
