class MessagesController < ApplicationController

  # before_action :authenticate_user!, only: [:create]

  # def create
  #   if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
  #     @message = Message.create(params.require(:message).permit(:user_id, :message, :room_id).merge(user_id: current_user.id))
  #   else
  #     flash[:alert] = "メッセージ送信に失敗しました。"
  #   end
  #   redirect_to "/rooms/#{@message.room_id}"
  # end

    before_action :follow_each_other, only: [:show]
  def show
    @user = User.find(params[:id])
    rooms = current_user.entries.pluck(:room_id)
    entrys = Entry.find_by(user_id: @user.id, room_id: rooms)

    unless entrys.nil?
      @room = entrys.room
    else
      @room = Room.new
      @room.save
      Entry.create(user_id: current_user.id, room_id: @room.id)
      Entry.create(user_id: @user.id, room_id: @room.id)
    end
    @messages = @room.messages
    @message = Message.new(room_id: @room.id)
  end
  def create
    @message = current_user.messages.new(message_params)
    @message.save
  end

  private
  def message_params
    params.require(:message).permit(:message, :room_id)
  end

  def follow_each_other
    user = User.find(params[:id])
    unless current_user.following?(user) && user.following?(current_user)
      redirect_to shops_path
    end
  end
end
