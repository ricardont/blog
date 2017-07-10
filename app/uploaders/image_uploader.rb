# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  
  
  # Choose what kind of storage to use for this uploader:
 # storage :file
  storage :fog
 
  # Override the directory where uploaded files will be stored.
  def store_dir
    "uploads/#{mounted_as}/#{model.article_id}"  
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end


  ########################################################################
  ########################################################################

  protected
  # generate secure token file name
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
  # Create different versions of your uploaded files:
  version :large do
  #    process :crop  => [800, 600]
      process :resize_to_limit => [-1, 800]
  end
  version :thumb do
  #    process :crop => [400, 300] 
      process :resize_to_limit => [-1, 300]
  end
  version :mini do
 #     process :crop => [200, 150]
      process :resize_to_limit => [-1, 130]
  end
  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end  
    ########################################################################
  # resize and croping images
  ########################################################################

