# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  def after_sign_in_path_for(resource)
    admin_posts_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def create
    super do |resource|
      flash[:notice] = t('devise.sessions.admin_signed_in') if resource.is_a?(Admin)
    end
  end
  
  def destroy
    super do
      flash[:notice] = t('devise.sessions.admin_signed_out')
    end
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
