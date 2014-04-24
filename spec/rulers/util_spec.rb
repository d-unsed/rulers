require 'spec_helper'

describe Rulers do
  describe '.to_underscore' do
    subject { Rulers.to_underscore(str) }

    context 'with capital letters only' do
      let(:str) { 'IMPORTANT_CONSTANT'}
      it { should eq('important_constant') }
    end

    context 'with dashes' do
      let(:str) { 'ab-bc-cd' }
      it { should eq('ab_bc_cd') }
    end

    context 'with double colons' do
      let(:str) { 'one::two::three' }
      it { should eq('one/two/three') }
    end

    context 'with camel case' do
      let(:str) { 'CamelCased1String' }
      it { should eq('camel_cased1_string') }
    end

    context 'with camel case c' do
      let(:str) { 'WEIRDCamelCase' }
      it { should eq('weird_camel_case') }
    end
  end
end
