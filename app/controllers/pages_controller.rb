class PagesController < ApplicationController
  layout :resolve_layout

  def home
  end

  def style
  end

  def feed
    # @user_zip = params[:zip]
    session[:zip] = params[:zip] if params[:zip]

    @pictures = Picture.where(location: session[:zip]).shuffle
    rest_of_pics = Picture.all.shuffle - @pictures
    @pictures += rest_of_pics
    @pictures = @pictures.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.js
    end

  end

  def message
  end

  def landing
  end

  def profile
    # binding.pry
    if current_user
      @users_pictures = Picture.where(user_id: current_user.id)
      @user = current_user
      @email = current_user.email
    else
      redirect_to new_user_session_path
    end
    
    @users_pictures = @users_pictures.paginate(page: params[:page], per_page: 10)
  end

  def favorites
    if current_user
      @pic_ids = Favorite.where(user_id: current_user.id)
      @pictures = @pic_ids.map do |p|
        Picture.find(p.picture_id)
      end
      @pictures = @pictures.paginate(page: params[:page], per_page: 10)
    else
      redirect_to new_user_session_path
    end
  end

  def pics
    if current_user
      @users_pictures = Picture.where(user_id: current_user.id)
    else
      redirect_to new_user_session_path
    end
    @users_pictures = @users_pictures.paginate(page: params[:page], per_page: 10)
  end


  private

  def resolve_layout
    case action_name
    when "home", "landing"
      "home_page_layout"
    when "feed", "favorites", "profile"
      "app_no_container"
    else
      "application"
    end
  end


end
