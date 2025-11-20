class EventTemplate < ApplicationRecord
  belongs_to :life_phase

  acts_as_list scope: :life_phase, column: :sort_order

  validates :title, :prompt, presence: true
end
