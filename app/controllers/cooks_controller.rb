class CooksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @cook = @user.cooks.new
    @cooks = @user.cooks.page(params[:page]).per(20).reverse_order
    @cook_tags = @user.cooks.map(&:tags).flatten.uniq
  end

  def show
    @user = User.find(params[:user_id])
    @cook = @user.cooks.find(params[:id])
    @cook_tags = @cook.tags
  end

  def create
    @user = User.find(params[:user_id])
    @cook = @user.cooks.new(cook_params)
    tag_list = params[:cook][:tag_name].split(nil)
    if @user != current_user
      flash.now[:alert] = 'ユーザー以外が登録することはできません'
      @user = User.find(params[:user_id])
      @cook_tags = @user.cooks.map(&:tags).flatten.uniq
      @cooks = @user.cooks.page(params[:page]).per(20).reverse_order
      render "cooks/index"
    else
      if @cook.save
        @cook.save_tag(tag_list)
        redirect_to user_cooks_path, notice: '料理が登録されました'
      else
        flash.now[:alert] = '料理の登録に失敗しました'
        @user = User.find(params[:user_id])
        @cook_tags = @user.cooks.map(&:tags).flatten.uniq
        @cooks = @user.cooks.page(params[:page]).per(20).reverse_order
        render "cooks/index"
      end
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @cook = @user.cooks.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @cook = @user.cooks.find(params[:id])
    tag_list = params[:cook][:tag_name].split(nil)
    if @user != current_user
      flash.now[:alert] = 'ユーザー以外が編集することはできません'
      @user = User.find(params[:user_id])
      @cook_tags = @user.cooks.map(&:tags).flatten.uniq
      @cooks = @user.cooks.page(params[:page]).per(20).reverse_order
      render "cooks/index"
    else
      if @cook.update(cook_params)
      @cook.save_tag(tag_list)
      redirect_to user_cook_path(@user, @cook.id)
      else
        flash.now[:alert] = '編集に失敗しました'
        render "edit"
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @cook = @user.cooks.find(params[:id])
    @cook.destroy
    redirect_to user_cooks_path
  end

  def search
    @user = User.find(current_user.id)
    @cook_tags = @user.cooks.map(&:tags).flatten.uniq               #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @tag = Tag.find(params[:tag_id])                                #クリックしたタグを取得
    @cooks = @tag.cooks.where(user_id: current_user.id).page(params[:page]).reverse_order           #クリックしたタグに紐付けられた投稿を全て表示
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
