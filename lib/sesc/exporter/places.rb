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
          cities.each do |city, places|
            Sesc::Exporter::Printer.tabulated('')
            Sesc::Exporter::Printer.tabulated(city)
            places.each do |(place, _)|
              Sesc::Exporter::Printer.tabulated("#{i += 1}. #{place}", 2)
            end
          end
        end
      end
    end
  end
end
