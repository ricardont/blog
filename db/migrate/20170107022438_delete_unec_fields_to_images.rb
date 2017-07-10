class DeleteUnecFieldsToImages < ActiveRecord::Migration
  def change
  	remove_column :images, :cover_file_name, :string
  	remove_column :images, :cover_content_type, :string
  	remove_column :images, :cover_file_size, :integer
  	remove_column :images, :cover_updated_at, :datetime
  	remove_column :images, :image, :string
  	remove_column :images, :res, :string
  end
end
