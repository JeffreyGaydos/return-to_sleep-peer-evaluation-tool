class CreateCourseAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :course_admins do |t|
      t.references :admin, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
