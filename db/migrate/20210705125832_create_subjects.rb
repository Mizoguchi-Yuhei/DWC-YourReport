class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.integer :test_id
      t.text :name
      t.integer :score
      t.integer :perfect
      t.integer :average

      t.timestamps
    end
  end
end
