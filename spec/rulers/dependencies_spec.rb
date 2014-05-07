require 'spec_helper'

describe Object do
  describe '.const_missing' do
    let(:const) { 'String' }

    before do
      allow(Object).to receive(:require)
      allow(Object).to receive(:const_get)
      allow(Rulers).to receive(:to_underscore)

      Object.const_missing(const)
    end

    it 'calls Rulers.to_underscore' do
      expect(Rulers).to have_received(:to_underscore).with(const)
    end

    it 'calls Object.const_get after loading' do
      expect(Object).to have_received(:const_get).with(const)
    end
  end
end
