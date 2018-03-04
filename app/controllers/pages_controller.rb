class PagesController < ApplicationController
  layout :resolve_layout

  def home
  end

  def feed
    session[:zip] = params[:zip] if params[:zip]

    @pictures = Picture.where(location: session[:zip])
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

  private

  def resolve_layout
    case action_name
    when "home", "landing"
      "home_page_layout"
    when "feed"
      "app_no_container"
    else
      "application"
    end
  end

end
