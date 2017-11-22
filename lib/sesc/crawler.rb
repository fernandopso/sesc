module Sesc
  class Crawler
    BASE_URL = 'https://www.sescsp.org.br'.freeze

    EVENTS_PATH = '/programacao/ajax/homeView.action?/programacao/ajax/homeView.action?atividades=&calendar_dates=&remove_dates=&maxResults=%s'.freeze

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
      URI(BASE_URL + set_max_result)
    end

    def set_max_result
      EVENTS_PATH % @number
    end
  end
end
