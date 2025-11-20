class Story < ApplicationRecord
  belongs_to :account
  belongs_to :user

  has_one :story_profile, dependent: :destroy
  has_many :chapters, dependent: :destroy
  has_many :story_sections, through: :chapters
  has_many :collaborations, dependent: :destroy
  has_many :helpers, through: :collaborations, source: :user
  has_many :photos, dependent: :destroy

  has_one_attached :cover_photo

  validates :title, presence: true

  enum :status, { draft: "draft", in_progress: "in_progress", complete: "complete", published: "published" }, default: :draft
end
