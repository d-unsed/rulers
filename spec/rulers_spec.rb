require 'spec_helper'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

describe 'App' do
	describe 'GET /' do
		before { get '/' }

		it 'is OK' do
			expect(last_response).to be_ok
		end

		it 'has correct response text' do
			body = last_response.body
			expect(body).to include('Rulers')
		end
	end
end
