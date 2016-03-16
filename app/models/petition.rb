class Petition < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  default_scope -> { order('created_at DESC') }
  validates :title, presence: true
  validates :text, presence: true
  validates :user_id, presence: true

  def voted_by?(user)
    votes.where(user_id: user.id).any?
  end
end