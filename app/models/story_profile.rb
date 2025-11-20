class StoryProfile < ApplicationRecord
  belongs_to :story

  validates :full_name, presence: true
end
