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
        @file ||= YAML.load_file(gem_path + '/config.yml')
      end

      def gem_path
        Gem::Specification.find_by_name('sesc').gem_dir
      end
    end
  end
end
