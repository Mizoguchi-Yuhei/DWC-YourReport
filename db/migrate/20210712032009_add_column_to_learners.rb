class AddColumnToLearners < ActiveRecord::Migration[5.2]
  def change
    add_index :learners, :name, unique: true
  end
end
