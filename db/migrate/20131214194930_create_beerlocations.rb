class CreateBeerlocations < ActiveRecord::Migration
  def change
    create_table :beerlocations do |t|
      t.integer :user_id
      t.text :location_name
      t.integer :location_id
      t.integer :beer_id
      t.text :comments
      t.decimal :price

      t.timestamps
    end
  end
end
