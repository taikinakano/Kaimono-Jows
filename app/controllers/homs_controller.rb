class HomsController < ApplicationController
  def top
  end

  def about
  end
  
  def mypage
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end  
end
