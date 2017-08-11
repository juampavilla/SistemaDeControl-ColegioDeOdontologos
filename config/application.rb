require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module Odontologos
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.assets.version = '1.0'
  end
end
