class MessagesController < ApplicationController
  def destroy
    @message = current_user.messages.find params[:id]
    if @message.update(is_deleted: true)
      redirect_to room_path(@message.room_id), notice: '削除しました'
    else
      flash.now[:alert] = '削除に失敗しました'
      redirect_to room_path(@message.room_id)
    end
  end
end