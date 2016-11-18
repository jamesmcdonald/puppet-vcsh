require 'spec_helper'
describe 'vcsh' do
  context 'with default values for all parameters' do
    it { should contain_class('vcsh') }
  end
end
