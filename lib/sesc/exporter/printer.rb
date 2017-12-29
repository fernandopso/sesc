# frozen_string_literal: true

module Sesc
  class Exporter
    class Printer
      def initialize(line, tab: 1, up: 0, down: 0)
        @line = line
        @tab  = tab
        @up   = up
        @down = down
      end

      def tabulated
        puts(output) unless ENV['DISABLE_OUTPUT']
      end

      private

      def output
        up_line + indentation + @line + down_line
      end

      def up_line
        "\n" * @up
      end

      def indentation
        ' ' * 4 * @tab
      end

      def down_line
        "\n" * @down
      end
    end
  end
end
