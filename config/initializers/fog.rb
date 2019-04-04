if Rails.env == "production"
  fog_config = {
      :provider               => 'AWS',
      :aws_access_key_id      =>  ENV["AWS_ACCESS_KEY_ID"],
      :aws_secret_access_key  => ENV["AWS_SECRET_ACCESS_KEY"],
      :region                 => ENV["AWS_REGION"]
  }
  bucket_name = ENV["S3_BUCKET"]
else
  fog_config = {
      :provider               => 'AWS',
      :aws_access_key_id      =>  Rails.application.secrets.aws_access_key_id,
      :aws_secret_access_key  => Rails.application.secrets.aws_secret_access_key,
      :region                 => Rails.application.secrets.aws_region
  }
  bucket_name = Rails.application.secrets.s3_bucket
end
CarrierWave.configure do |config|
  config.fog_credentials = fog_config
  config.fog_directory  = bucket_name
end
