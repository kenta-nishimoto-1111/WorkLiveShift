Sentry.init do |config|
  config.dsn = 'https://f88f23863fbc4f56996a62705c9853f6@o994601.ingest.sentry.io/5956870'
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