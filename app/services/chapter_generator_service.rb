# Service to generate chapters for a story based on its profile
class ChapterGeneratorService
  def initialize(story)
    @story = story
    @profile = story.story_profile
  end

  def generate_chapters
    return [] unless @profile

    chapters = []

    # Base chapters - always include
    chapters << create_chapter_from_phase("family-heritage", 1)
    chapters << create_chapter_from_phase("child-years", 2)
    chapters << create_chapter_from_phase("school-years", 3)

    chapter_number = 4

    # Conditional chapters based on profile
    if @profile.education_level.in?([ "college", "graduate", "doctorate" ])
      chapters << create_chapter_from_phase("college-years", chapter_number)
      chapter_number += 1
    end

    # Military service
    if @profile.military_service?
      chapters << create_custom_chapter(
        "Military Service",
        "Your service in the military",
        chapter_number
      )
      chapter_number += 1
    end

    # Romance/Marriage
    chapters << create_chapter_from_phase("romance-marriage", chapter_number)
    chapter_number += 1

    # Career
    chapters << create_chapter_from_phase("career-years", chapter_number)
    chapter_number += 1

    # Raising Family (if appropriate based on age)
    if @profile.current_age.to_i >= 30
      chapters << create_chapter_from_phase("raising-family", chapter_number)
      chapter_number += 1
    end

    # Middle Age
    if @profile.current_age.to_i >= 45
      chapters << create_chapter_from_phase("middle-age", chapter_number)
      chapter_number += 1
    end

    # Retirement
    if @profile.current_age.to_i >= 60
      chapters << create_chapter_from_phase("retirement", chapter_number)
      chapter_number += 1
    end

    # Golden Years
    if @profile.current_age.to_i >= 70
      chapters << create_chapter_from_phase("golden-years", chapter_number)
      chapter_number += 1
    end

    # Always include wisdom chapter at the end
    chapters << create_chapter_from_phase("life-wisdom", chapter_number)

    chapters
  end

  def create_chapters!
    generated_chapters = generate_chapters.compact # Remove nil chapters

    generated_chapters.each do |chapter_attrs|
      @story.chapters.create!(chapter_attrs)
    end

    @story.chapters.count
  end

  private

  def create_chapter_from_phase(slug, number)
    phase = LifePhase.find_by(slug: slug)
    return nil unless phase

    {
      life_phase: phase,
      title: phase.name,
      description: phase.description,
      chapter_number: number,
      sort_order: number
    }
  end

  def create_custom_chapter(title, description, number)
    {
      life_phase: nil,
      title: title,
      description: description,
      chapter_number: number,
      sort_order: number
    }
  end
end
