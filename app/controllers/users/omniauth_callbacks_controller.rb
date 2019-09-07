# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    callback_from :google
  end

  private

  def callback_from(provider)
    provider = provider.to_s
    @user = User.find_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      @user_email = session[:email]
      sign_in_and_redirect @user, event: :authentication
    else
      session[:email] = @user.email
      session[:password] = @user.password
      session[:provider] = @user.provider
      session[:uid] = @user.uid
      redirect_to new_user_registration_sns_path
    end
  end


end
