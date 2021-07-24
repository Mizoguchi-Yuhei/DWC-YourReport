class CreateDailyScores < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_scores do |t|
      t.integer :daily_test_id
      t.text :name
      t.integer :score

      t.timestamps
    end
  end
end
