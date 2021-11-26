class CreatePeerEvals < ActiveRecord::Migration[6.0]
  def change
    create_table :peer_evals do |t|
      t.integer :score
      t.string :comment

      t.timestamps
    end
  end
end
