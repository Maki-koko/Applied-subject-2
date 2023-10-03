class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
# follow→モデルで作ったfollow(user_id)メソッドをそのまま使用してる
  end
  

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer  
  end


end
