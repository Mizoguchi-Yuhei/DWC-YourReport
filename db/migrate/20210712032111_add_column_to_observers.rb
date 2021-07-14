class AddColumnToObservers < ActiveRecord::Migration[5.2]
  def change
    add_index :observers, :name, unique: true
  end
end
