require 'spec_helper'

describe Rulers::Application do
  subject { last_response }

  describe 'GET /test/index' do
    before { get '/test/index' }

    it { should be_ok }
    its(:body) { should include('Index text') }
  end

  describe 'GET /favicon.ico' do
    before { get '/favicon.ico' }

    it { should be_not_found }
  end
end