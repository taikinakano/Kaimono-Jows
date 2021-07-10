class EventsController < ApplicationController


  def show
    @user = User.find(params[:id])
    @events = Event.where(user_id: @user.id)
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save!
    @events = Event.where(user_id: current_user.id)
    #pp @events
  end

  def update
    event = Event.find(params[:ud])
    @event = Event.where(user_id: current_user.id)
    event.update(event_params)
  end

  def destroy
    @user = User.find(params[:id])
    event = Event.find(params[:id])
    event.destroy
    redirect_to event_path(@user)
  end

  private
    def event_params
        params.require(:event).permit(:title, :start, :end, :user_id, :body)
    end
end
