module Sesc
  class Exporter
    class Term
      class << self
        def print(events)
          events.each do |event|
            puts ''
            title(event)
            availability(event)
            date(event)
            place(event)
            age_limit(event)
            price(event)
            url(event)
          end
        end

        private

        def title(event)
          puts "Título: #{event[:title]} | #{event[:description]}"
        end

        def price(event)
          puts "Preço: #{event[:price]}"
        end

        def place(event)
          puts "Local: #{event[:place]}"
        end

        def date(event)
          puts "Data: #{event[:date]} | #{event[:hours]}"
        end

        def availability(event)
          puts "Disponibilidade: #{event[:availability]}" if event[:availability]
        end

        def age_limit(event)
          puts "Classificação: #{event[:age_limit]}"
        end

        def url(event)
          puts "URL: #{Sesc::Crawler::BASE_URL + event[:url]}"
        end
      end
    end
  end
end
