require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Gator::AS3::RobotLegs::CommandGenerator do
  before :all do
     clean
     gator('dummy.FooFunk')
  end

  it 'should create the expected files' do
    file('dummy/FooFunk.as').should exist
  end
end