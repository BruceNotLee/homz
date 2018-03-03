class PagesController < ApplicationController
  layout "app_no_container"

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
end
