module EnvCredentials
  ABSTRACTAPI_KEY ||= ENV.fetch('ABSTRACTAPI_KEY').freeze
  GMAIL_USERNAME ||= ENV.fetch('GMAIL_USERNAME').freeze
  GMAIL_PASSWORD ||= ENV.fetch('GMAIL_PASSWORD').freeze
end
