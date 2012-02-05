SPEC_ROOT = File.dirname(__FILE__)
$LOAD_PATH.unshift(SPEC_ROOT)
#$LOAD_PATH.unshift(File.join(SPEC_ROOT, '..', 'lib'))

require 'bundler'
Bundler.require(:default, :development)

require 'rack'
require 'rack/test'

RSpec.configure do |config|
  include Rack::Test::Methods
end
