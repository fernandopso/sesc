module Sesc
  class Exporter
    class Term
      class << self
        def print(events)
          events.each do |event|
            puts ''
            title(event)
            date(event)
            place(event)
            price(event)
            hours(event)
            age_limit(event)
            availability(event)
            url(event)
          end
        end

        private

        def date(event)
          puts_tab "Datas: #{event[:date]}"
        end

        def title(event)
          puts_tab "#{event[:title]} | #{event[:description]}"
        end

        def price(event)
          puts_tab "Preço: #{event[:price]}"
        end

        def place(event)
          puts_tab "Local: #{event[:place]}"
        end

        def availability(event)
          puts_tab "Disponibilidade: #{event[:availability]}" if event[:availability]
        end

        def age_limit(event)
          puts_tab "Classificação: #{event[:age_limit]}"
        end

        def hours(event)
          puts_tab "Horários: #{event[:hours]}"
        end

        def url(event)
          puts_tab "URL: #{Sesc::Crawler::BASE_URL + event[:url]}"
        end

        def puts_tab(line)
          puts " " * 5 + line
        end
      end
    end
  end
end
