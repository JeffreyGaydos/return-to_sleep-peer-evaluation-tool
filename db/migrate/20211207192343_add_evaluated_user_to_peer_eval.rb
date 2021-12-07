class AddEvaluatedUserToPeerEval < ActiveRecord::Migration[6.0]
  def change
    add_column :peer_evals, :evaluated_user, :integer
  end
end
