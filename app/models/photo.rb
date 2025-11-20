class Photo < ApplicationRecord
  belongs_to :story
  belongs_to :story_section, optional: true

  has_one_attached :image

  acts_as_list scope: :story, column: :sort_order

  validates :image, presence: true
end
