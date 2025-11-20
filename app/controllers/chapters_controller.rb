class ChaptersController < ApplicationController
  before_action :require_authentication
  before_action :set_story
  before_action :authorize_story
  before_action :set_chapter, only: [ :show, :edit, :update, :destroy ]

  def index
    @chapters = @story.chapters.order(:sort_order).includes(:story_sections)
  end

  def show
    @sections = @chapter.story_sections.order(:sort_order)
  end

  def new
    @chapter = @story.chapters.build
  end

  def create
    @chapter = @story.chapters.build(chapter_params)
    @chapter.sort_order = @story.chapters.maximum(:sort_order).to_i + 1
    @chapter.chapter_number = @chapter.sort_order

    if @chapter.save
      redirect_to story_chapter_path(@story, @chapter), notice: "Chapter created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @chapter.update(chapter_params)
      redirect_to story_chapter_path(@story, @chapter), notice: "Chapter updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @chapter.destroy
    redirect_to story_path(@story), notice: "Chapter deleted."
  end

  def generate
    unless @story.story_profile
      redirect_to @story, alert: "Please complete the story profile first."
      return
    end

    generator = ChapterGeneratorService.new(@story)
    chapters_created = generator.create_chapters!

    redirect_to @story, notice: "Successfully generated #{chapters_created} chapters based on the story profile!"
  end

  def move
    @chapter.insert_at(params[:position].to_i)
    head :ok
  end

  private

  def set_story
    @story = Story.find(params[:story_id])
  end

  def set_chapter
    @chapter = @story.chapters.find(params[:id])
  end

  def authorize_story
    unless @story.user == Current.user || @story.helpers.include?(Current.user)
      redirect_to stories_path, alert: "You don't have access to this story."
    end
  end

  def chapter_params
    params.require(:chapter).permit(:title, :description, :life_phase_id)
  end
end
