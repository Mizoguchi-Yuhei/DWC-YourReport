class CreateDailyTests < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_tests do |t|
      t.integer :learner_id
      t.string :name
      t.integer :score

      t.timestamps
    end
  end
end
