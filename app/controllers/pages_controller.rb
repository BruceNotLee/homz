class PagesController < ApplicationController
  def home
  end

  def feed
    session[:zip] = params[:zip] if params[:zip]

    @pictures = Picture.where(location: session[:zip])
    rest_of_pics = Picture.all - @pictures
    @pictures += rest_of_pics
  end

  def message
  end
end
