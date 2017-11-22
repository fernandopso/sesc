# frozen_string_literal: true

module Sesc
  class Exporter
    class Term
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
            puts_tab ''
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
          puts_tab ''
          puts_tab '##'
          puts_tab "# #{sesc}"
          puts_tab '##'
        end

        def date(event)
          puts_tab "Datas: #{event[:date]}"
        end

        def title(event)
          puts_tab "#{event[:title]} | #{event[:description]}"
        end

        def price(event)
          puts_tab "Preço: #{event[:price]}"
        end

        def availability(event)
          return unless event[:availability]
          puts_tab "Disponibilidade: #{event[:availability]}"
        end

        def age_limit(event)
          puts_tab "Classificação: #{event[:age_limit]}"
        end

        def hours(event)
          puts_tab "Horários: #{event[:hours]}"
        end

        def url(event)
          puts_tab "URL: #{Sesc::Config.base_url + event[:url]}"
        end

        def puts_tab(line)
          puts(' ' * 5 + line) unless ENV['DISABLE_OUTPUT']
        end
      end
    end
  end
end
