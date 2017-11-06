require 'pry'
require 'net/http'
require 'nokogiri'

require_relative 'sesc/cities/sp'
require_relative 'sesc/crawler'
require_relative 'sesc/parser/events'
require_relative 'sesc/parser/body'
require_relative 'sesc/exporter/term'

Sesc::SP.new.print_on_terminal
