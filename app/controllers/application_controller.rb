class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :info, :error, :success
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    cookies[:locale] = I18n.locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def change_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
    redirect_to root_path
  end
end
