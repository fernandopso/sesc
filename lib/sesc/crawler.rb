# frozen_string_literal: true

module Sesc
  class Crawler
    def initialize(number, places)
      @number = number
      @places = places.to_s.split(',')
    end

    def get
      request.body
    end

    private

    def request
      @request ||= Net::HTTP.post_form(uri_url_path, q: '')
    end

    def uri_url_path
      URI(Sesc::Config.base_url + Sesc::Config.events_path + attrs)
    end

    def attrs
      number + places.to_s
    end

    def number
      Sesc::Config.number % @number
    end

    def places
      @places.map { |p| Sesc::Config.places % from_to(p) }.join if @places.any?
    end

    def from_to(place)
      Sesc::Cli::Filter::PLACES.values.flatten(1)[place.to_i - 1].last
    end
  end
end
