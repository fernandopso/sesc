# frozen_string_literal: true

module Sesc
  class Exporter
    class Printer
      attr_accessor :text, :up, :down, :color, :background

      def initialize(text, params = {})
        self.text       = text
        self.up         = params.fetch(:up, 0)
        self.down       = params.fetch(:down, 0)
        self.color      = params.fetch(:color, :blue)
        self.background = params.fetch(:background, :red)
      end

      def terminal
        puts(output) unless ENV['DISABLE_OUTPUT']
      end

      private

      def output
        up_blank_lines + colorize + down_blank_lines
      end

      def colorize
        text.colorize(color: color, background: background)
      end

      def up_blank_lines
        "\n" * up
      end

      def down_blank_lines
        "\n" * down
      end
    end
  end
end
