require 'coveralls'
Coveralls.wear!

require 'rspec'
require 'rack/test'

require 'rulers'

RSpec.configure do |config|
	config.include Rack::Test::Methods

	def app
		Rulers::Application.new
	end
end
