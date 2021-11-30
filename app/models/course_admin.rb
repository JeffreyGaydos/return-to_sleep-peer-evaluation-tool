class CourseAdmin < ApplicationRecord
  belongs_to :admin, validate: false
  belongs_to :course, validate: true

  validates_uniqueness_of :admin_id, :scope => [:course_id]
  validates_uniqueness_of :course_id, :scope => [:admin_id]
end
