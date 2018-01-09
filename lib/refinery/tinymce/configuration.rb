module Refinery
  module Tinymce
    include ActiveSupport::Configurable

    config_accessor :extra_plugins

    self.extra_plugins = []
  end
end
