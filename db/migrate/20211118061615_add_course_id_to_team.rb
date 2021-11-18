class AddCourseIdToTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :course_id, :integer
  end
end
