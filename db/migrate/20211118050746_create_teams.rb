class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.boolean :needs_eval
      t.timestamps
    end
  end
end
