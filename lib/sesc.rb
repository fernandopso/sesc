# frozen_string_literal: true

require 'net/http'
require 'nokogiri'
require 'yaml'

require 'sesc/cli/options'
require 'sesc/cli/filter'
require 'sesc/cli'
require 'sesc/crawler'
require 'sesc/cities'
require 'sesc/cities/sp'
require 'sesc/config'
require 'sesc/parser/sp/events'
require 'sesc/parser/sp/body'
require 'sesc/exporter/places'
require 'sesc/exporter/printer'
require 'sesc/exporter/events'
require 'sesc/version'

module Sesc
  def self.sp(number, places)
    Sesc::Cities::Sp.new(crawler_sesc(number, places)).print_on_terminal
  end

  private_class_method

  def self.crawler_sesc(number, places)
    Sesc::Crawler.new(number, places).get
  end
end
