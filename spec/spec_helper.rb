$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'thor'
require 'gator'
require 'gator/as3/generators'
require File.dirname(__FILE__) + '/../lib/gator/as3/robotlegs/generators'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f }

RSpec.configure do |config|
  
end
