class Account < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :stories, dependent: :destroy

  validates :name, presence: true
  validates :account_type, presence: true, inclusion: { in: %w[business family individual] }
end
