class CourseAdmin < ApplicationRecord
  belongs_to :admin
  belongs_to :course

  validates_uniqueness_of :admin_id, :scope => [:course_id]
  validates_uniqueness_of :course_id, :scope => [:admin_id]
end
