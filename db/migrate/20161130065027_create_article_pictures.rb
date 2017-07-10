class CreateArticlePictures < ActiveRecord::Migration
  def change
    create_table :article_pictures do |t|
      t.references :article, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :res
      t.string :dir

      t.timestamps null: false
    end
  end
end
