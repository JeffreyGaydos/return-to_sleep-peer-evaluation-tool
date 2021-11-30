class Course < ApplicationRecord
    validates :class_number, presence: true, numericality: { greater_than: 0 }
    has_many :users_course
    has_many :users, through: :users_course
end
