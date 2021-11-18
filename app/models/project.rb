class Project < ApplicationRecord
  belongs_to :team
  validates :name, presence: true, length: { maximum: 255 }
end
