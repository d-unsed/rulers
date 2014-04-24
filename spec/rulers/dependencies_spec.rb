require 'spec_helper'

describe Object do
  describe '.const_missing' do
    before do
      Kernel.stub(:require).and_return(nil)
      Object.stub(:const_get)
    end

    it 'calls Rulers.to_underscore' do
      expect(Rulers).to receive(:to_underscore).with('String').and_return('string')
      Object.const_missing('String')
    end
  end
end
