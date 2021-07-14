class NotificationsController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  # def destroy
  #   @notification = current_user.notifications.find(params[:user_id])
  #   @notification.destroy
  #   redirect_to notifications_path
  # end
end
