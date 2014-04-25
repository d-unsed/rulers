require 'spec_helper'

describe Rulers::Controller do
  subject(:controller) { Rulers::Controller.new(nil) }

  it { should respond_to(:env) }

  describe '#render' do
    let(:eruby)     { double() }
    let(:view_name) { 'index' }
    let(:contents)  { 'Template contents' }
    let(:locals)    { { local_variable: 'some_value' } }
    let(:env)       { { env_variable: 'env_value' } }
    let(:call!)     { controller.render(view_name, locals) }

    before do
      File.stub(:read).and_return('Template contents')
      Erubis::Eruby.stub(:new).and_return(eruby)
      controller.stub(:env).and_return(env)
      eruby.stub(:result)
    end

    it 'reads a template' do
      expect(File).to receive(:read).with('app/views/index.html.erb')
      call!
    end

    it 'creates Erubis object with templates contents' do
      expect(Erubis::Eruby).to receive(:new).with(contents)
      call!
    end

    it 'renders template with local variables' do
      expect(eruby).to receive(:result).with(locals.merge(env: env))
      call!
    end
  end
end
