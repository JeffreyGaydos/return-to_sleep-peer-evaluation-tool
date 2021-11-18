class Team < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :needs_eval, presence:true


  # Relations
  # has_and_belongs_to_many :users # many to many users
  # belongs_to :course
  #
end
