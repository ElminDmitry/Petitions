class Petition < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_and_belongs_to_many :genres
  ACTIVE_DAYS = 90
  NEED_VOTES = 100
  default_scope -> { order('created_at DESC') }
  validates :title, presence: true
  validates :text, presence: true
  validates :user_id, presence: true

  def voted_by?(user)
    votes.where(user_id: user.id).any?
  end

  def expired?(id)
    user.petitions.find_by(id: id).created_at < ACTIVE_DAYS.days.ago
  end
end