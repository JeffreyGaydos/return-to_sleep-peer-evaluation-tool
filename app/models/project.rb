class Project < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 255 }
  # validates :team_id, prece
  belongs_to :team, required: true
  
  has_many :peer_evals
end
