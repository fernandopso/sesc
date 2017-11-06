module Sesc
  class SP
    def initialize(max_results = nil)
      @max_results = max_results
    end

    def print_on_terminal
      Sesc::Exporter::Term.print(events)
    end

    private

    def events
      Sesc::Parser::Events.new(html_response).to_hash
    end

    def html_response
      Sesc::Crawler.new(@max_results).get
    end
  end
end
