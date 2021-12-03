class Course < ApplicationRecord
    validates :class_number, presence: true, numericality: { greater_than: 0 }
    
    has_many :user_course
    has_many :users, through: :user_course

    has_many :course_admin
    has_many :admins, through: :course_admin

    has_many :teams
end
