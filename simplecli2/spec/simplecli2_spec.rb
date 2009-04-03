require File.dirname(__FILE__) + '/spec_helper'

describe SimpleCLI2 do

  it 'should come out-of-the-box with some commands' do
    default_commands = SimpleCLI2::Bin.new(%w( some args passed to new Bin )).commands
    default_commands.should include(:help)
    default_commands.should include(:commands)
  end

end
