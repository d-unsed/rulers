require 'spec_helper'

describe Rulers::Application do
  describe '#get_controller_and_action' do
    let(:call!) { subject.get_controller_and_action(path) }

    context 'with existing controller' do
      let(:path) { '/test/action' }
      before { stub_const('TestController', Class.new) }

      it 'extracts correct controller and action' do
        expect(call!).to eq([TestController, 'action'])
      end
    end

    context 'with nonexistent controller' do
      let(:path) { '/fail/action' }

      it 'raises error' do
        expect { call! }.to raise_error(LoadError)
      end
    end
  end
end
