class TagsController < ApplicationController

  def show
    @tags = Tag.all
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to cooks_path
  end
end
