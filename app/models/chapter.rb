class Chapter < ApplicationRecord
  belongs_to :story
  belongs_to :life_phase, optional: true

  has_many :story_sections, dependent: :destroy
  has_many :photos, through: :story_sections

  acts_as_list scope: :story, column: :sort_order

  validates :title, presence: true
end
