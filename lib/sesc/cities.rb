module Sesc
  class Cities
    FOLTER = "./lib/sesc/cities/".freeze

    DEFAULT = 'sp'.freeze

    def self.include?(city)
      valids.include?(city)
    end

    def self.valids
      Dir[FOLTER + '*'].map {|b| b.gsub(FOLTER, '').gsub('.rb', '') }
    end
  end
end
