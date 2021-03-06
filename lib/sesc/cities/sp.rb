# frozen_string_literal: true

module Sesc
  class Cities
    class Sp
      def initialize(html_response)
        @html_response = html_response
      end

      def print_on_terminal
        Sesc::Exporter::Events.print(events)
      end

      private

      def events
        Sesc::Parser::Sp::Events.new(@html_response).to_hash
      end
    end
  end
end
