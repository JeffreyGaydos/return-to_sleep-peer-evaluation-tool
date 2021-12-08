class AddNeedsEvalToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :needs_eval, :boolean
  end
end
