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
      if places?
        Sesc::Exporter::Places.print
      elsif Sesc::Cities.include?(city)
        Sesc.send(city, number)
      else
        Sesc::Exporter::Printer.tabulated "Cidade #{city} não encontrada"
      end
    end
  end
end
