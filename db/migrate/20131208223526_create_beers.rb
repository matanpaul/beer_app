class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.text :beer_name
      t.string :category

      t.timestamps
    end
  end
end
