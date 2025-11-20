class StoriesController < ApplicationController
  before_action :require_authentication
  before_action :set_story, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_story, only: [ :show, :edit, :update, :destroy ]

  def index
    @stories = Current.user.owned_stories.includes(:story_profile, :chapters)
    @assisted_stories = Current.user.assisted_stories.includes(:story_profile, :chapters)
  end

  def show
    @chapters = @story.chapters.order(:sort_order)
  end

  def new
    @story = Story.new
  end

  def create
    @story = Current.user.owned_stories.build(story_params)
    @story.account = Current.user.account
    @story.status = :draft

    if @story.save
      # Redirect to profile setup
      redirect_to new_story_profile_path(@story), notice: "Story created! Let's set up the profile."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @story.update(story_params)
      redirect_to @story, notice: "Story was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @story.destroy
    redirect_to stories_path, notice: "Story was successfully deleted."
  end

  private

  def set_story
    @story = Story.find(params[:id])
  end

  def authorize_story
    # User must be owner or helper
    unless @story.user == Current.user || @story.helpers.include?(Current.user)
      redirect_to stories_path, alert: "You don't have access to this story."
    end
  end

  def story_params
    params.require(:story).permit(:title, :subtitle, :cover_photo)
  end
end
