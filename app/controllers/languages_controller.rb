class LanguagesController < ApplicationController
  before_action :require_authentication

  def update
    language = params[:language]

    if %w[en ko].include?(language)
      Rails.logger.debug "Updating user #{Current.user.id} language to #{language}"
      if Current.user.update(language: language)
        # Reload both the user and session to ensure the association is fresh
        Current.session.reload
        Current.user.reload
        I18n.locale = language.to_sym
        Rails.logger.debug "Update successful. User language: #{Current.user.language}, I18n.locale: #{I18n.locale}"
        redirect_to dashboard_path, notice: t("messages.language_changed")
      else
        Rails.logger.debug "Update failed: #{Current.user.errors.full_messages}"
        redirect_to dashboard_path, alert: "Failed to update language"
      end
    else
      redirect_to dashboard_path, alert: "Invalid language"
    end
  end
end
