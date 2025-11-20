class Session < ApplicationRecord
  belongs_to :user, inverse_of: :sessions

  def user
    User.find(user_id)
  end
end
