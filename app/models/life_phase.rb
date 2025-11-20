class LifePhase < ApplicationRecord
  has_many :chapters
  has_many :event_templates, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
end
