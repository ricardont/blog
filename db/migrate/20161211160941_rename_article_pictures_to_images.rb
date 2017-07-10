class RenameArticlePicturesToImages < ActiveRecord::Migration
  def change
    rename_table :article_pictures, :images
  end
end
