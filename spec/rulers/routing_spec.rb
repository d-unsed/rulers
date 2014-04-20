require 'spec_helper'

describe Rulers::Application do
  describe '#get_controller_and_action' do
    let(:env)  {{ 'PATH_INFO' => path }}
    let(:call!) { subject.get_controller_and_action(env) }

    context 'with existing path' do
      let(:path) { '/test/action' }

      it 'calls object' do
        expect(Object).to receive(:const_get).with('TestController')
        call!
      end

      it 'returns correct array' do
        stub_const('TestController', Class.new)
        expect(call!).to eq([TestController, 'action'])
      end
    end

    context 'with nonexistent path' do
      let(:path) { '/fail/action' }

      it 'raises error' do
        expect { call! }.to raise_error(NameError)
      end
    end
  end
end
