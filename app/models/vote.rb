class Vote < ActiveRecord::Base
  belongs_to :petition
  belongs_to :user
  validates :user_id, uniqueness: {scope: :petition_id}
  validate :active_petition, on: :create

  def active_petition
    errors.add(:petition_id, 'is not active') if :petition.expired?(petition_id)
  end
end
