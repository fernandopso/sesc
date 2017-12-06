# frozen_string_literal: true

module Sesc
  class Crawler
    def initialize(number)
      @number = number
    end

    def get
      request.body
    end

    private

    def request
      @request ||= Net::HTTP.post_form(uri_url_path, q: '')
    end

    def uri_url_path
      URI(Sesc::Config.base_url + Sesc::Config.events_path + set_max_result)
    end

    def set_max_result
      Sesc::Config.number % @number
    end
  end
end
