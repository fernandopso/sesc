require 'pry'
require 'net/http'
require 'nokogiri'

require_relative 'sesc/cities/sp'
require_relative 'sesc/crawler'
require_relative 'sesc/parser/events'
require_relative 'sesc/parser/body'
require_relative 'sesc/exporter/term'

module Sesc
  def self.sp
    Sesc::SP.new(crawler_sesc).print_on_terminal
  end

  private

  def self.crawler_sesc
    Sesc::Crawler.new(10).get
  end
end


Sesc.sp
