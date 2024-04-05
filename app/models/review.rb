class Review < ApplicationRecord
  belongs_to :user
  belongs_to :accommodation

  has_rich_text :content

  validates :user_id, presence: true
  validates :accommodation_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :rating, presence: true, inclusion: { in: 0..5 }
  validates :content, presence: true
  validate :user_has_no_reviews, :user_is_a_guest

  def user_has_no_reviews
    if Review.where(user_id: user_id, accommodation_id: accommodation_id).count >= 1
      errors.add(:user_id, " - The specified user already reviewed the accommodation")
    end
  end

  def user_is_a_guest
    unless User.find(user_id).is_a_guest?
      errors.add(:user_id, " - The specified user is not a guest")
    end
  end
end
