require 'spec_helper'
describe 'vcsh' do
  context 'with default values for all parameters' do
    it { should contain_class('vcsh') }
    it { should contain_package('vcsh') }
    it { should contain_package('git') }
  end
end
