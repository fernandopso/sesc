module Sesc
  module Parser
    module Sp
      class Body
        def initialize(response)
          @response = response
        end

        def events
          body.elements.last.search('article')
        end

        private

        def body
          document.search('body').first
        end

        def document
          Nokogiri::HTML(@response)
        end
      end
    end
  end
end
