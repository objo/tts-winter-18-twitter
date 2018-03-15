CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV["amazon_api_key"],        # required
    aws_secret_access_key: ENV["amazon_secret_key"],     # required
    region:                'us-east-1',                    # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'tts-winter-objo' # required
end
