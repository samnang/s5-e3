$:.unshift File.expand_path('../../lib', __FILE__)

require 'binary_search_tree'
require 'rspec'

RSpec::Matchers.define :have_value do |expected|
  match do |actual|
    actual.value == expected
  end
end
