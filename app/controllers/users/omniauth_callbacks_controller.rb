class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end

  def after_sign_in_path_for(resource)
    # request.env['omniauth.origin'] || root_path
    feed_path
  end
end
