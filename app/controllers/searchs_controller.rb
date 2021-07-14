class SearchsController < ApplicationController
  before_action :search_params
 	def search                                   #user/show検索
 	  if @content == ''
 	  	@shop = Shop.new
 	  	@user = User.find(current_user.id)
      @shops = @user.shops.page(params[:page]).reverse_order
 	  	render 'users/show'
		elsif @model == 'shop_name'
		  user = User.find(current_user.id)
			@records = user.shops.search_for(@record, @method).page(params[:page]).reverse_order
		else
		 user = User.find(current_user.id)
		 @records = Shop.searched_for(@record, @method).page(params[:page]).reverse_order
		end
	end

	def searches                                 #shop/imdex検索
		if @model == 'shop_name'
			@records = Shop.search_for(@record, @method).page(params[:page]).reverse_order
		else
		 @records = Shop.searched_for(@record, @method).page(params[:page]).reverse_order
		end
	end

	private
	def search_params
	  @model = params[:model]
		@content = params[:content]
		@method = params[:method]
	  unless @content.blank?                        #漢字、ひらがな、ローマ字検索記述
      if @content.match(/[一-龠々]/)
          @record = @content.to_kanhira.to_roman
      elsif @content.is_hira? || @content.is_kana?
         @record = @content.to_roman
      else
          @record = @content
      end
    end
  end
end
