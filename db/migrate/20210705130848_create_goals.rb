class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :learner_id
      t.text :body

      t.timestamps
    end
  end
end
