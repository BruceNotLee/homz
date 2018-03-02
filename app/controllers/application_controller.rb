class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user! #only somewhere goes here eventually
end
