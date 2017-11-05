module Sesc
  class Parser
    class Events
      def initialize(html_body_events)
        @events = Body.new(html_body_events).events
      end

      def to_hash
        @events.map do |event|
          {
            url:          url(          event.elements[0] ),
            image_url:    image_url(    event.elements[0] ),
            availability: availability( event.elements[0] ),
            category:     category(     event.elements[1] ),
            title:        title(        event.elements[1] ),
            date:         date(         event.elements[1] ),
            hours:        hours(        event.elements[1] ),
            place:        place(        event.elements[1] ),
            description:  description(  event.elements[1] ),
            age_limit:    age_limit(    event.elements[3] ),
            price:        price(        event.elements[3] )
          }
        end
      end

      private

      def url(element)
        element.css('a').first.attributes['href'].value
      end

      def image_url(element)
        element.css('span').first.attributes.values.last.value[22..-3]
      end

      def availability(element)
        element.css('span').last.children.first.text if element.css('span').last.children.first
      end

      def category(element)
        element.css('p').first.children[1].text
      end

      def title(element)
        element.css('a')[1].attributes['data-ga-action'].value
      end

      def date(element)
        clear_text_for(element.css('span').first.children.first.text)
      end

      def hours(element)
        clear_text_for(element.css('span')[1].children.first.text)
      end

      def place(element)
        clear_text_for(element.css('span')[2].children.first.text)
      end

      def description(element)
        clear_text_for(element.css('form').last.children[1].children.first.text)
      end

      def age_limit(element)
        element.children[3].elements.last.text
      end

      def price(element)
        p = clear_text_for(element.children[5].text)
        p.split('R$ ').join(" R$ ").strip
      end

      def clear_text_for(text)
        text.delete("\r").delete("\n").delete("\t").strip
      end
    end
  end
end
