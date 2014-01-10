require 'rubygems'
require 'bundler/setup'

Dir.glob("spec/**/*steps.rb") { |f| load f, true }

require 'rspec/autorun'
require 'turnip'
require 'turnip/capybara'
