module Sesc
  class SP
    def initialize(html_response)
      @html_response = html_response
    end

    def print_on_terminal
      Sesc::Exporter::Term.print(events)
    end

    private

    def events
      Sesc::Parser::Events.new(@html_response).to_hash
    end
  end
end
