if Rails.application.config.require_master_key
  Secrets = Rails.application.credentials
else
  Secrets = Rails.application.secrets
end
