
Config.setup do |config|
  config.const_name = 'Settings'
  config.env_prefix = 'SETTINGS'
  config.fail_on_missing = true
  config.knockout_prefix = '^^' # Don't use double dash as it conflicts with RSA keys
  config.merge_nil_values = true
  config.overwrite_arrays = true

  # Example:
  # SETTINGS_FOO=bar => Settings.foo == 'bar'
  config.use_env = true
  config.env_separator = '__'
  config.env_converter = :downcase
  config.env_parse_values = true
  config.evaluate_erb_in_yaml = false
end

# Config values normally pulled from HC_ENVIRONMENT,
# but we allow Rails.env to cover development, test.
Config.load_and_set_settings(
  'config/settings.yml',
  # "config/settings/groups/#{ENV.fetch('HC_ENVIRONMENT_GROUP', 'no_group')}.yml",
  "config/settings/#{ENV.fetch('HC_ENVIRONMENT') { Rails.env }}.yml",
  'config/settings.local.yml'
)