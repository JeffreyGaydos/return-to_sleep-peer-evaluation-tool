class TeamsUser < ApplicationRecord
  belongs_to :team, validate: true
  belongs_to :user, validate: true
  
  validates_uniqueness_of :user_id, :scope => [:team_id]
  validates_uniqueness_of :team_id, :scope => [:user_id]
end
