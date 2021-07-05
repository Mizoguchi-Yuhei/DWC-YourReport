class CreateFollowRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :follow_requests do |t|
      t.integer :learner_id
      t.integer :observer_id

      t.timestamps
    end
  end
end
