# frozen_string_literal: true

module Sesc
  module Parser
    module Sp
      class Events
        VALUES = %i[
          url image_url availability category title date
          hours place description age_limit price
        ].freeze

        def initialize(html_body_events)
          @events = Body.new(html_body_events).events
        end

        def to_hash
          group_by_place(load_events)
        end

        private

        def load_events
          @events.map do |event|
            VALUES.each_with_object({}) do |value, memo|
              memo[value] = send(value, event)
            end
          end
        end

        def group_by_place(events)
          events.group_by { |event| event[:place] }
        end

        def url(event)
          event.elements[0].css('a').first.attributes['href'].value
        end

        def image_url(event)
          i = event.elements[0].css('span').first
          i.attributes.values.last.value[22..-3]
        end

        def availability(event)
          event.elements[0].css('span').last.children.first&.text
        end

        def category(event)
          event.elements[1].css('p').first.children[1].text
        end

        def title(event)
          event.elements[1].css('a')[1].attributes['data-ga-action'].value
        end

        def date(event)
          clear_text_for(
            event.elements[1].css('span').first.children.first.text
          )
        end

        def hours(event)
          clear_text_for(event.elements[1].css('span')[1].children.first.text)
        end

        def place(event)
          p = event.elements[1].css('span')[2].children.first.text
          "SESC #{clear_text_for(p)}"
        end

        def description(event)
          clear_text_for(
            event.elements[1].css('form').last.children[1].children.first.text
          )
        end

        def age_limit(event)
          event.elements[3].children[3].elements.last.text
        end

        def price(event)
          p = clear_text_for(event.elements[3].children[5].text)
          p.split('R$ ').join(' R$ ').strip
        end

        def clear_text_for(text)
          text.delete("\r").delete("\n").delete("\t").strip
        end
      end
    end
  end
end
