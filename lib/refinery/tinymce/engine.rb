module Refinery
  module Tinymce
    class Engine < ::Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery
      engine_name :refinery_tinymce

      # set the manifests and assets to be precompiled
      config.to_prepare do
        Rails.application.config.assets.precompile += %w(
          tinymce/themes/modern/theme.js
          refinery-fix.css
          tinymce.css
          tinymce/skins/content/default/*
          tinymce/skins/ui/oxide/*
          tinymce/plugins/link/*
          tinymce/plugins/image/*
          tinymce/plugins/fullscreen/*
          tinymce/plugins/code/*
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
        %w(tinymce/skins/content/default/content.min refinery-fix).each do |stylesheet|
          Refinery::Core.config.register_visual_editor_stylesheet stylesheet
        end

        %W(refinery/tinymce_manifest tinymce/themes/silver/theme).each do |javascript|
          Refinery::Core.config.register_visual_editor_javascript javascript
        end

        Refinery::Pages.config.friendly_id_reserved_words << 'tinymceiframe'
      end
    end
  end
end
