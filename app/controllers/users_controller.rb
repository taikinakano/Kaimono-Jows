class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @shop = Shop.new
    @user = User.find(params[:id])
    @shops = @user.shops.page(params[:page]).reverse_order

  end

  def create
  end

  def index
    @users = User.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to user_path
  end

  def withdrow_confirm
    @user = User.find(params[:id])
  end

  def withdrow
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

 	def search                                   #user/show検索
	  @model = params[:model]
	  @content = params[:content]
	  @method = params[:method]
 	  if @content == ''
 	  	@shop = Shop.new
 	  	@user = User.find(params[:id])
      @shops = @user.shops.page(params[:page]).reverse_order
 	  	render 'users/show'
		elsif @model == 'shop_name'
		  unless @content.blank?                        #漢字、ひらがな、ローマ字検索記述
	      if @content.match(/[一-龠々]/)
	          @record = @content.to_kanhira.to_roman
	      elsif @content.is_hira? || @content.is_kana?
	         @record = @content.to_roman
	      else
	          @record = @content
	      end
	   end
		  user = User.find(params[:id])
			@records = user.shops.search_for(@record, @method).page(params[:page]).reverse_order
		else
		 user = User.find(params[:id])
		 @records = user.shops.searched_for(@content, @method).page(params[:page]).reverse_order
		end
	end



  private

  def user_params
    params.require(:user).permit(:name, :image, :bgimage, :introduction)
  end

end
