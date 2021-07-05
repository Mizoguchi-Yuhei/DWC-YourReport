class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.integer :learner_id
      t.text :name
      t.text :pros
      t.text :cons
      t.string :image_id

      t.timestamps
    end
  end
end
