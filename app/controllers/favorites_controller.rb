class FavoritesController < ApplicationController
  # render with Javascript
  respond_to :js

  def favorite
    @user = current_user
    @picture = Picture.find(params[:id])
    @user.favorite!(@picture)
  end

  def unfavorite
    @user = current_user
    @favorite = @user.favorites.find_by_picture_id(params[:id])
    @picture = Picture.find(params[:id])
    @favorite.destroy!
  end
end
