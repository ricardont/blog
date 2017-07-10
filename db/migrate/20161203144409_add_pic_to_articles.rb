class AddPicToArticles < ActiveRecord::Migration
  def change
  		add_attachment :articles,:pic
  end
end
