class CreateObserverEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :observer_events do |t|
      t.integer :observer_id
      t.string :title
      t.text :event
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
