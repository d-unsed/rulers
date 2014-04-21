require 'spec_helper'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

describe Rulers::Application do
	describe 'GET /test/index' do
		before { get '/test/index' }

		it 'is OK' do
			expect(last_response).to be_ok
		end

		it 'has correct response text' do
			body = last_response.body
			expect(body).to include('Index text')
		end
	end
end

describe Rulers::Controller do
	subject { Rulers::Controller.new(nil) }

	it { should respond_to(:env) }
end
