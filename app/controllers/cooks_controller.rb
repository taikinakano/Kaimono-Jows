class CooksController < ApplicationController
  def index
    @cook = Cook.new
    @user = User.find(current_user.id)
    @cooks = @user.cooks.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(current_user.id)
    @cook = @user.cooks.find(params[:id])
  end

  def create
    @cook = current_user.cooks.new(cook_params)
    @cook.save
    redirect_to cooks_path
  end

  def edit
    @user = User.find(current_user.id)
    @cook = @user.cooks.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    @cook = @user.cooks.find(params[:id])
    @cook.update(cook_params)
    redirect_to cook_path(@cook.id)
  end

  def destroy
    @user = User.find(current_user.id)
    @cook = @user.cooks.find(params[:id])
    @cook.destroy
    redirect_to cooks_path
  end

  private

  def cook_params
    params.require(:cook).permit(:cook_name, :image, :cook_method, :cook_material)
  end
end
