class Vote < ActiveRecord::Base
  belongs_to :petition
  belongs_to :user
  validates :petition_id, uniqueness: {scope: :user_id}
end