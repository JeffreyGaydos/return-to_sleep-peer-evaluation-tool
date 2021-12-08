class PeerEval < ApplicationRecord
  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :comment, presence: true, length: { maximum: 255 }

  # define database relationships
  belongs_to :user, required: true
  belongs_to :team, required: true
  belongs_to :project, required: true
  
end
