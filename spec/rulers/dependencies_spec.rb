require 'spec_helper'

describe Object do
  describe '.const_missing' do
    before { Object.stub(:require) }

    let(:const) { 'String' }
    let(:call!) { Object.const_missing(const) }

    it 'calls Rulers.to_underscore' do
      expect(Rulers).to receive(:to_underscore).with(const)
      call!
    end

    it 'calls Object.const_get after loading' do
      expect(Object).to receive(:const_get).with(const)
      call!
    end
  end
end
