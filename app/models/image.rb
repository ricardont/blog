class Image < ActiveRecord::Base
	belongs_to :article
	validates  :article, presence: true
	belongs_to :user
	mount_uploader :dir,  ImageUploader
	attr_accessor :image_width, :image_height
end
