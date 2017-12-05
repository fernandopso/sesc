# frozen_string_literal: true

module Sesc
  class Exporter
    class Printer
      class << self
        def tabulated(line, tabulation = 1)
          puts(' ' * 4 * tabulation + line) unless ENV['DISABLE_OUTPUT']
        end
      end
    end
  end
end
