# require 'carrierwave/storage/abstract'
# require 'carrierwave/storage/file'
# require 'carrierwave/storage/fog'

  if Rails.env.production?
    CarrierWave.configure do |config|
      # config.storage :fog
      config.fog_provider = 'fog/aws'

      config.fog_credentials = {
        # Configuration for Amazon S3
        :provider              => 'AWS',
        :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
        :aws_secret_access_key => ENV['S3_SECRET_KEY'],
        :region => ENV['S3_REGION']
      }
      config.fog_directory     =  ENV['S3_BUCKET']
    end
  # else
  #     config.storage :file
  #     config.enable_processing = false if Rails.env.test?
    
  end

