unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAT2NDLJRX3N2Q4YQK',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'rails-photo-124'
    config.cache_storage = :fog
  end
end
