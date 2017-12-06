# frozen_string_literal: true

module Sesc
  class Config
    class << self
      ATTRIBUTES = %w[
        base_url
        events_path
        number
        places
      ].freeze

      ATTRIBUTES.each do |attr|
        define_method(attr) do
          file[attr]
        end
      end

      private

      def file
        @file ||= YAML.load_file('config.yml')
      end
    end
  end
end
