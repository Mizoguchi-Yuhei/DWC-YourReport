class CreateLearnerEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :learner_events do |t|
      t.integer :learner_id
      t.string :title
      t.text :event
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
