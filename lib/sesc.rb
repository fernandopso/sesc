require 'net/http'
require 'nokogiri'

require 'sesc/cli/methods'
require 'sesc/cli'
require 'sesc/crawler'
require 'sesc/cities'
require 'sesc/cities/sp'
require 'sesc/parser/sp/events'
require 'sesc/parser/sp/body'
require 'sesc/exporter/term'
require 'sesc/version'

module Sesc
  def self.sp(number_of_events)
    Sesc::Cities::Sp.new(crawler_sesc(number_of_events)).print_on_terminal
  end

  private

  def self.crawler_sesc(number_of_events)
    Sesc::Crawler.new(number_of_events).get
  end
end
