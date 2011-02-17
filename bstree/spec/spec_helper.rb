$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

require 'bstree'
require 'rspec'

RSpec::Matchers.define :have_value do |expected|
  match do |actual|
    actual.value == expected
  end
end
