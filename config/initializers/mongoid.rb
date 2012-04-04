Mongoid.configure do |config|
  config.allow_dynamic_fields = false
  config.identity_map_enabled = true
  config.persist_in_safe_mode = true
end