class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  before_action :set_locale

  private

  def set_locale
    # Ensure session is resumed before checking user
    resume_session if Current.session.nil?
    
    Rails.logger.debug "DEBUG: set_locale called"
    if Current.user
      user_language = Current.user.language&.to_sym
      Rails.logger.debug "DEBUG: Current.user found: #{Current.user.id}, language: #{user_language.inspect}"
      I18n.locale = user_language || I18n.default_locale
    else
      Rails.logger.debug "DEBUG: No Current.user found"
      I18n.locale = extract_locale_from_accept_language_header || I18n.default_locale
    end
    Rails.logger.debug "DEBUG: I18n.locale set to: #{I18n.locale}"
  end

  def extract_locale_from_accept_language_header
    return nil unless request.env["HTTP_ACCEPT_LANGUAGE"]

    request.env["HTTP_ACCEPT_LANGUAGE"].scan(/^[a-z]{2}/).first
  end
end
