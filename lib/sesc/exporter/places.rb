# frozen_string_literal: true

module Sesc
  class Exporter
    class Places
      class << self
        def print
          print_cities(Sesc::Cli::Filter::PLACES)
        end

        private

        def print_cities(cities, i = 0)
          example
          cities.each do |city, places|
            Sesc::Exporter::Printer.new(city, up: 1).tabulated
            places.each do |(place, _)|
              Sesc::Exporter::Printer.new("#{i += 1}. #{place}", tab: 2).tabulated
            end
          end
        end

        def example
          Sesc::Exporter::Printer.new("Example: sesc -p 1,3,10", tab: 0).tabulated
        end
      end
    end
  end
end
