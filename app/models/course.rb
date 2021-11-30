class Course < ApplicationRecord
    validates :class_number, presence: true, numericality: { greater_than: 0 }
   # validates :name, presence: true, length: { maximum: 255, minimum: 2 }
    has_many :users_course
    has_many :users, through: :users_course
end
