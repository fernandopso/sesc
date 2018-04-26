# frozen_string_literal: true

module Sesc
  class Exporter
    class Painter
      attr_accessor :text, :color, :background

      def initialize(text, options = {})
        self.text       = text
        self.color      = options.fetch(:color, :light_white)
        self.background = options.fetch(:background, :black)
      end

      def default
        text.colorize(color: color, background: background)
      end
    end
  end
end
