# frozen_string_literal: true

module Sesc
  class Exporter
    class Printer
      def initialize(text, up: 0, down: 0)
        @text = text
        @up   = up
        @down = down
      end

      def terminal
        puts(output) unless ENV['DISABLE_OUTPUT']
      end

      private

      def output
        up_blank_lines + @text + down_blank_lines
      end

      def up_blank_lines
        "\n" * @up
      end

      def down_blank_lines
        "\n" * @down
      end
    end
  end
end
