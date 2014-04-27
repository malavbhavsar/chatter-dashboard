Rails.application.config.middleware.use OmniAuth::Builder do
    provider :salesforce, Rails.application.secrets.salesforce_key, Rails.application.secrets.salesforce_secret , {:scope => "id api refresh_token"}
end