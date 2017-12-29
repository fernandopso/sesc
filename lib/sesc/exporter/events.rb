# frozen_string_literal: true

module Sesc
  class Exporter
    class Events
      class << self
        def print(sescs)
          sescs.each do |sesc, events|
            place(sesc)
            print_event_for(events)
          end
        end

        private

        def print_event_for(events)
          events.each do |event|
            title(event)
            date(event)
            price(event)
            hours(event)
            age_limit(event)
            availability(event)
            url(event)
          end
        end

        def place(sesc)
          pprint ''
          pprint '##'
          pprint "# #{sesc}"
          pprint '##'
        end

        def date(event)
          pprint "Datas: #{event[:date]}"
        end

        def title(event)
          pprint("#{event[:title]} | #{event[:description]}", up: 1)
        end

        def price(event)
          pprint "Preço: #{event[:price]}"
        end

        def availability(event)
          return unless event[:availability]
          pprint "Disponibilidade: #{event[:availability]}"
        end

        def age_limit(event)
          pprint "Classificação: #{event[:age_limit]}"
        end

        def hours(event)
          pprint "Horários: #{event[:hours]}"
        end

        def url(event)
          pprint "URL: #{Sesc::Config.base_url + event[:url]}"
        end

        def pprint(line, up: 0)
          Sesc::Exporter::Printer.new(line, up: up).tabulated
        end
      end
    end
  end
end
