class CourseUser < ApplicationRecord
  belongs_to :user, validate: true
  belongs_to :course, validate: true

  validates_uniqueness_of :user_id, :scope => [:course_id]
  validates_uniqueness_of :course_id, :scope => [:user_id]
end
