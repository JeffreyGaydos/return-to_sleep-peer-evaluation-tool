class Course < ApplicationRecord
    validates :class_number, presence: true, numericality: { greater_than: 0 }
    has_many :course_user
    has_many :users, through: :course_user

    has_many :course_admin
    has_many :admins, through: :course_admin
end
