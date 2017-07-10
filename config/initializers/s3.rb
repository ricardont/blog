CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => "AKIAJFVYJAR5JJFKGKSA",
      :aws_secret_access_key  => "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",
      :region                 => 'us-east-1' # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = "sml-img"
end

