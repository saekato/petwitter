require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.development?
  config.fog_provider = 'fog/aws' #required
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_IAM_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_IAM_ACCESS_KEY'],
    region: 'ap-northeast-1'
    #host:                  's3.example.com',             # optional, defaults to nil
    #endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.asset_host = 'https://s3-us-west-2.amazonaws.com/petwitter111'
  config.fog_directory  = 'petwitter111'                # required
  config.fog_public     = false                                                 # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}"} # optional, defaults to {}


end
end