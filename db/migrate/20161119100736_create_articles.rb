  class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.float :price
      t.string :location
      t.float :sq_mts_t
      t.float :sq_mts_c
      t.float :baths
      t.integer :lvls
      t.integer :parks
      t.text :desc
      t.text :addr

      t.integer :visits

      t.timestamps null: false
    end
  end
end
