# frozen_string_literal: true

module Sesc
  class Config
    class << self
      def base_url
        file['base_url']
      end

      def events_path
        file['events_path']
      end

      private

      def file
        @file ||= YAML.load_file('config.yml')
      end
    end
  end
end
