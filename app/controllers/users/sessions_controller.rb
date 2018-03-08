# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #
  # end

  # POST /resource/sign_in
  def create

  resource = User.find_for_database_authentication(email: params[:user][:email])
  return invalid_login_attempt unless resource

  if resource.valid_password?(params[:user][:password])
    sign_in :user, resource
    return render nothing: true#############
    # redirect_to root_path
  end

  invalid_login_attempt

  # respond_to do |format|
  #   if @user.save
  #     format.html { redirect_to feed_path, notice: 'You are signed in.' }
  #     format.js
  #   else
  #     format.html { render :new }
  #     format.json { render json: @devise.errors, status: :unprocessable_entity }
  #   end
  # end

 end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def invalid_login_attempt
    set_flash_message(:alert, :invalid)
    render json: flash[:alert], status: 401
  end
end
