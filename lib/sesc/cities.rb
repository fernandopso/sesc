# frozen_string_literal: true

module Sesc
  class Cities
    FOLTER = './lib/sesc/cities/'

    def self.include?(city)
      valids.include?(city.downcase)
    end

    def self.valids
      Dir[FOLTER + '*'].map { |b| b.gsub(FOLTER, '').gsub('.rb', '').downcase }
    end
  end
end
