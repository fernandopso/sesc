require 'net/http'
require 'nokogiri'

require 'sesc/cities/sp'
require 'sesc/crawler'
require 'sesc/parser/events'
require 'sesc/parser/body'
require 'sesc/exporter/term'

module Sesc
  def self.sp
    Sesc::SP.new(crawler_sesc).print_on_terminal
  end

  private

  def self.crawler_sesc
    Sesc::Crawler.new(10).get
  end
end
