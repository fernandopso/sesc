# frozen_string_literal: true

module Sesc
  class Cities
    CITIES_FOLDER = '/lib/sesc/cities/'

    def self.include?(city)
      valids.include?(city.downcase)
    end

    def self.valids
      Dir[cities_path + '*'].map { |b| b.gsub(cities_path, '').gsub('.rb', '').downcase }
    end

    def self.cities_path
      Gem::Specification.find_by_name('sesc').gem_dir + CITIES_FOLDER
    end
  end
end
