require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/great_expectations'
require 'turn'
require 'transparent_proxy'

Turn.config do |c|
  c.format = :pretty
  c.natural = true
  c.ansi = true
end