class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = 'このポストをお気に入りリストに追加しました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    # micropost = Micropost.find(params[:micropost_id])
    micropost = Favorite.find(params[:id]).micropost
    current_user.unlike(micropost)
    flash[:success] = 'このポストをお気に入りリストから削除しました。'
    redirect_back(fallback_location: root_url)
  end
end
