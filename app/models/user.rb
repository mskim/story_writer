class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  belongs_to :account

  has_many :owned_stories, class_name: "Story", foreign_key: "user_id", dependent: :destroy
  has_many :collaborations, dependent: :destroy
  has_many :assisted_stories, through: :collaborations, source: :story

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: true
  validates :name, presence: true
end
