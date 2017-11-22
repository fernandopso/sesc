# frozen_string_literal: true

require 'net/http'
require 'nokogiri'

require 'sesc/cli/options'
require 'sesc/cli'
require 'sesc/crawler'
require 'sesc/cities'
require 'sesc/cities/sp'
require 'sesc/config'
require 'sesc/parser/sp/events'
require 'sesc/parser/sp/body'
require 'sesc/exporter/term'
require 'sesc/version'

module Sesc
  def self.sp(number)
    Sesc::Cities::Sp.new(crawler_sesc(number)).print_on_terminal
  end

  private

  def self.crawler_sesc(number)
    Sesc::Crawler.new(number).get
  end
end
