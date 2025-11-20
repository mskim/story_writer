class Collaboration < ApplicationRecord
  belongs_to :story
  belongs_to :user
  belongs_to :inviter, class_name: "User", foreign_key: "invited_by"

  enum :permission_mode, { direct_edit: "direct_edit", suggestion: "suggestion" }
  enum :role, { editor: "editor", viewer: "viewer" }
  enum :status, { pending: "pending", accepted: "accepted", declined: "declined" }

  validates :permission_mode, :role, :status, presence: true
end
