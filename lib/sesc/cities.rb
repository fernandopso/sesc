# frozen_string_literal: true

module Sesc
  class Cities
    def self.include?(city)
      valids.include?(city.downcase)
    end

    def self.valids
      Dir[sesc_path + '*'].map { |b| b.gsub(sesc_path, '').gsub('.rb', '').downcase }
    end

    def self.sesc_path
      Gem::Specification.find_by_name('sesc').gem_dir
    end
  end
end
