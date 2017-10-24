# frozen_string_literal: true

config_file = "#{Rails.root}/config/mailgun.yml"
file_contents = ERB.new(File.read(config_file)).result
MAILGUN_CONFIG = YAML.safe_load(file_contents)[Rails.env]

Mailgun.configure do |config|
  config.api_key = MAILGUN_CONFIG[:mailgun_api_key]
end
