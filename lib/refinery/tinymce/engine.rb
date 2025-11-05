module Refinery
  module Tinymce
    class Engine < ::Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery
      engine_name :refinery_tinymce

      # Add vendor assets to the asset pipeline
      initializer 'refinery.tinymce.assets' do |app|
        app.config.assets.paths << root.join('vendor', 'assets', 'javascripts').to_s
        app.config.assets.paths << root.join('vendor', 'assets', 'stylesheets').to_s
        
        # Add tinymce-rails gem assets to the asset pipeline
        begin
          tinymce_root = Gem::Specification.find_by_name('tinymce-rails').gem_dir
          app.config.assets.paths << File.join(tinymce_root, 'vendor', 'assets', 'javascripts')
          app.config.assets.paths << File.join(tinymce_root, 'app', 'assets', 'sprockets')
          app.config.assets.paths << File.join(tinymce_root, 'app', 'assets', 'javascripts')
        rescue Gem::LoadError
          Rails.logger.warn "tinymce-rails gem not found"
        end
      end

      # set the manifests and assets to be precompiled
      config.to_prepare do
        Rails.application.config.assets.precompile += %w(
          tinymce/themes/silver/*
          tinymce.css
          tinymce/skins/content/**/*
          tinymce/skins/ui/**/*
          tinymce/models/**/*
          tinymce/icons/**/*
          tinymce/plugins/link/*
          tinymce/plugins/image/*
          tinymce/plugins/fullscreen/*
          tinymce/plugins/code/*
          tinymce/plugins/lists/*
          tinymce/plugins/stylebuttons/*
          tinymce/plugins/refineryimage/*
          tinymce/plugins/refinerylink/*
          refinery/tinymce_manifest.js
        )
      end

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinerycms_tinymce"
          plugin.hide_from_menu = true
          plugin.menu_match = %r{refinery/tinymce}
        end
      end

      config.after_initialize do
        Refinery.register_engine Refinery::Tinymce
      end

      after_inclusion do
        %W(refinery/tinymce_manifest).each do |javascript|
          Refinery::Core.config.register_visual_editor_javascript javascript
        end

        Refinery::Pages.config.friendly_id_reserved_words << 'tinymceiframe'
      end
    end
  end
end
