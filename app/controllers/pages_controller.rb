class PagesController < ApplicationController
  layout :resolve_layout

  def home
  end

  def feed
    session[:zip] = params[:zip] if params[:zip]

    @pictures = Picture.where(location: session[:zip])
    rest_of_pics = Picture.all.shuffle - @pictures
    @pictures += rest_of_pics
  end

  def message
  end

  def landing
  end

  private

  def resolve_layout
    case action_name
    when "home"
      "home_page_layout"
    when "feed"
      "app_no_container"
    else
      "application"
    end

end
