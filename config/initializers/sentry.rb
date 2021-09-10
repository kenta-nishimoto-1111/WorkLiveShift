Sentry.init do |config|
  config.dsn = 'https://cac2065c77be45cfa18d940aa7ac9cee@o994601.ingest.sentry.io/5953195'
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