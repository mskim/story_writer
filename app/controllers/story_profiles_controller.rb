class StoryProfilesController < ApplicationController
  before_action :require_authentication
  before_action :set_story
  before_action :authorize_story
  before_action :set_profile, only: [ :edit, :update ]

  def new
    @profile = @story.build_story_profile
  end

  def create
    @profile = @story.build_story_profile(profile_params)

    if @profile.save
      # Automatically generate chapters based on the profile
      generator = ChapterGeneratorService.new(@story)
      chapters_created = generator.create_chapters!

      redirect_to @story, notice: "Profile saved successfully! #{chapters_created} chapters have been automatically generated for your story."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to @story, notice: "Profile was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_story
    @story = Story.find(params[:story_id])
  end

  def set_profile
    @profile = @story.story_profile
  end

  def authorize_story
    unless @story.user == Current.user
      redirect_to stories_path, alert: "You don't have access to this story."
    end
  end

  def profile_params
    params.require(:story_profile).permit(
      :full_name, :birth_year, :current_age, :gender, :birthplace,
      :education_level, :schools_attended, :primary_occupation, :other_occupations,
      :military_service, :military_details,
      :major_awards, :significant_life_events, :hobbies_interests,
      :influential_people, :life_mission, :life_philosophy,
      :advice_to_children, :greatest_lessons_learned
    )
  end
end
