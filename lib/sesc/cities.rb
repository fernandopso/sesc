# frozen_string_literal: true

module Sesc
  class Cities
    FOLTER = "./lib/sesc/cities/".freeze

    def self.include?(city)
      valids.include?(city)
    end

    def self.valids
      Dir[FOLTER + '*'].map {|b| b.gsub(FOLTER, '').gsub('.rb', '') }
    end
  end
end
