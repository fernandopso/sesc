# frozen_string_literal: true

module Sesc
  class Exporter
    class Printer
      attr_accessor :text, :up, :down

      def initialize(text, params = {})
        self.text       = text
        self.up         = params.fetch(:up, 0)
        self.down       = params.fetch(:down, 0)
      end

      def terminal
        puts output unless ENV['DISABLE_OUTPUT']
      end

      private

      def output
        up_blank_lines + colorize + down_blank_lines
      end

      def colorize
        text
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
