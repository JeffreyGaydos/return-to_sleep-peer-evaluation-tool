class CreatePeerEvals < ActiveRecord::Migration[6.0]
  def change
    create_table :peer_evals do |t|
      t.integer :score
      t.string :comment

      t.belongs_to :user, null: false, index: true
      t.belongs_to :team, null: false, index: true
      t.belongs_to :project, null: false, index: true

      t.timestamps
    end
  end
end
