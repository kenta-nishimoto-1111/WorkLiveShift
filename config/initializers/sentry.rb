Sentry.init do |config|
  config.dsn = 'https://9826f6438e284238904def295eb2ab81@o997283.ingest.sentry.io/5955666'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set tracesSampleRate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production
  config.traces_sample_rate = 0.5
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end
