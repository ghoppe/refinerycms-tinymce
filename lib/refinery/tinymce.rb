module Refinery
  module Tinymce
    require 'refinery/tinymce/engine'

    class << self
      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end
    end
  end
end
