# frozen_string_literal: true

module Sesc
  class Exporter
    class Events
      class << self
        ATTRIBUTES = %i[
          title description place date price hours age_limit availability url
        ].freeze

        def print(sescs)
          sescs.each do |sesc, events|
            events.each do |event|
              print_event_for(sesc, event) if availability?(event)
            end
          end
        end

        private

        def print_event_for(sesc, event)
          title(event)
          description(event)
          place(sesc)
          date(event)
          price(event)
          hours(event)
          age_limit(event)
          url(event)
        end

        def title(event)
          pprint paint(event[:title], color: :blue), up: 1
        end

        def description(event)
          pprint paint('Descrição: ') + paint(event[:description], yellow)
        end

        def place(sesc)
          pprint paint('Local: ') + paint(sesc, yellow)
        end

        def date(event)
          pprint paint('Datas: ') + paint(event[:date], yellow)
        end

        def price(event)
          pprint paint('Preço: ') + paint(event[:price], yellow)
        end

        def availability?(event)
          event[:availability] != 'Esgotado'
        end

        def age_limit(event)
          pprint paint('Classificação: ') + paint(event[:age_limit], yellow)
        end

        def hours(event)
          pprint paint('Horários: ') + paint(event[:hours], yellow)
        end

        def url(event)
          pprint paint(Sesc::Config.base_url + event[:url])
        end

        def pprint(line, up: 0)
          Sesc::Exporter::Printer.new(line, up: up).terminal
        end

        def paint(text, options = {})
          Sesc::Exporter::Painter.new(text, options).default
        end

        def yellow
          { color: :yellow }
        end
      end
    end
  end
end
