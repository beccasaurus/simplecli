require File.dirname(__FILE__) + '/spec_helper'

describe SimpleCLI2 do

  # hmm ... ideas:
  #
  #   #commands (::Command objects ? with .name .run[!]([]) .usage etc)
  #   #command_names [:this, :that]
  #   #command(:name){ ... } # *define* a command (& returns object)
  #   #command(:name) # return the Command object [no defining block]
  #
  #   - call parse to figure out what to run ... then run ...
  #   #run  args
  #   #run! args
  #
  #   - figure out what to run ... would this actually set things like global options?  hmmm ... 
  #   #parse  args
  #   #parse! args
  #

  it 'should come out-of-the-box with some commands' do
    default_commands = SimpleCLI2::Bin.new(%w( some args passed to new Bin )).commands
    default_commands.should include(:help)
    default_commands.should include(:commands)
  end

end
