class AddCoverToArticlePictures < ActiveRecord::Migration
  def change
  	add_attachment :article_pictures, :cover
  end
end
