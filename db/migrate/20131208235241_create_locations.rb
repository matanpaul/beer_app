class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :lat
      t.decimal :lon
      t.text :name

      t.timestamps
    end
  end
end
