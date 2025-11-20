class StorySection < ApplicationRecord
  belongs_to :chapter

  has_rich_text :content
  has_many :photos, dependent: :destroy

  acts_as_list scope: :chapter, column: :sort_order

  validates :title, presence: true
end
