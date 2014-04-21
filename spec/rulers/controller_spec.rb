require 'spec_helper'

describe Rulers::Controller do
  subject { Rulers::Controller.new(nil) }

  it { should respond_to(:env) }
end
