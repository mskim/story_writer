class DashboardController < ApplicationController
  before_action :require_authentication

  def index
    @owned_stories = Current.user.owned_stories.includes(:story_profile, :chapters).order(updated_at: :desc)
    @assisted_stories = Current.user.assisted_stories.includes(:story_profile, :chapters).order(updated_at: :desc)
  end
end
