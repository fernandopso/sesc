# frozen_string_literal: true

module Sesc
  class Cli
    include Sesc::Cli::Options

    attr_accessor :args

    def initialize(args)
      self.args = args
    end

    def call
      return 'TODO: Write help' if help?
      if Sesc::Cities.include?(city)
        Sesc.send(city, number)
      else
        puts "Não foi possível encontrar a cidade: #{city}"
      end
    end
  end
end
