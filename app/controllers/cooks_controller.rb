class CooksController < ApplicationController
  def index
    @cook = current_user.cooks.new
    @user = User.find(current_user.id)
    @cooks = @user.cooks.page(params[:page]).per(20).reverse_order
    @cook_tags = @user.cooks.map(&:tags).flatten.uniq
  end

  def show
    @user = User.find(current_user.id)
    @cook = @user.cooks.find(params[:id])
    @cook_tags = @cook.tags
  end

  def create
    @cook = current_user.cooks.new(cook_params)
    tag_list = params[:cook][:tag_name].split(nil)
    if @cook.save
    @cook.save_tag(tag_list)
    redirect_to cooks_path
    else
      render "index"
    end
  end

  def edit
    @user = User.find(current_user.id)
    @cook = @user.cooks.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    @cook = @user.cooks.find(params[:id])
    tag_list = params[:cook][:tag_name].split(nil)
    if @cook.update(cook_params)
    @cook.save_tag(tag_list)
    redirect_to cook_path(@cook.id)
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @cook = @user.cooks.find(params[:id])
    @cook.destroy
    redirect_to cooks_path
  end

  def search
    @user = User.find(current_user.id)
    @cook_tags = @user.cooks.map(&:tags).flatten.uniq               #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @tag = Tag.find(params[:tag_id])                                #クリックしたタグを取得
    @cooks = @tag.cooks.page(params[:page]).reverse_order           #クリックしたタグに紐付けられた投稿を全て表示
  end

  def tags
    @user = User.find(current_user.id)
    @cook_tags = @user.cooks.map(&:tags).flatten.uniq
  end

  private

  def cook_params
    params.require(:cook).permit(:cook_name, :image, :cook_method, :cook_material)
  end
end
