class AddNameColumnToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :name, :string
  end
end
