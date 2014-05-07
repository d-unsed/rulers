require 'spec_helper'

describe Rulers::Controller do
  subject { described_class.new(nil) }

  it { should respond_to(:env) }

  describe '#controller_name' do
    before do
      allow(Rulers).to receive(:to_underscore)
      allow(subject).to receive(:class) { 'TestController' }

      subject.controller_name
    end

    it 'deletes "Controller" and calls to_underscore' do
      expect(Rulers).to have_received(:to_underscore).with('Test')
    end
  end

  describe '#render' do
    let(:eruby)     { double(result: true) }
    let(:contents)  { 'Template contents' }
    let(:locals)    { { local_variable: 'some_value' } }
    let(:env)       { { env_variable: 'env_value' } }

    before do
      allow(File).to receive(:read) { contents }
      allow(Erubis::Eruby).to receive(:new) { eruby }
      allow(subject).to receive(:env) { env }
      allow(subject).to receive(:controller_name) { 'test' }

      subject.render('index', locals)
    end

    it 'reads a template' do
      expect(File).to have_received(:read).with('app/views/test/index.html.erb')
    end

    it 'renders template with local variables' do
      expect(eruby).to have_received(:result).with(locals.merge(env: env))
    end
  end
end
