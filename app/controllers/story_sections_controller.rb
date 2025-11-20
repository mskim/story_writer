class StorySectionsController < ApplicationController
  before_action :require_authentication
  before_action :set_story_and_chapter
  before_action :authorize_story
  before_action :set_section, only: [ :edit, :update, :destroy ]

  def new
    @section = @chapter.story_sections.build
    # Load event templates for this chapter's life phase
    @templates = @chapter.life_phase&.event_templates&.order(:sort_order) || []
  end

  def create
    @section = @chapter.story_sections.build(section_params)
    @section.sort_order = @chapter.story_sections.maximum(:sort_order).to_i + 1

    if @section.save
      redirect_to story_chapter_path(@story, @chapter), notice: "Section created successfully."
    else
      @templates = @chapter.life_phase&.event_templates&.order(:sort_order) || []
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @templates = @chapter.life_phase&.event_templates&.order(:sort_order) || []
  end

  def update
    if @section.update(section_params)
      redirect_to story_chapter_path(@story, @chapter), notice: "Section updated successfully."
    else
      @templates = @chapter.life_phase&.event_templates&.order(:sort_order) || []
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @section.destroy
    redirect_to story_chapter_path(@story, @chapter), notice: "Section deleted."
  end

  def move
    @section.insert_at(params[:position].to_i)
    head :ok
  end

  private

  def set_story_and_chapter
    @story = Story.find(params[:story_id])
    @chapter = @story.chapters.find(params[:chapter_id])
  end

  def set_section
    @section = @chapter.story_sections.find(params[:id])
  end

  def authorize_story
    unless @story.user == Current.user || @story.helpers.include?(Current.user)
      redirect_to stories_path, alert: "You don't have access to this story."
    end
  end

  def section_params
    params.require(:story_section).permit(:title, :content, :start_year, :end_year)
  end
end
