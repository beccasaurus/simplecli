require File.dirname(__FILE__) + '/spec_helper'

describe SimpleCLI2 do

  # hmm ... ideas:
  #
  #   #commands (::Command objects ? with .name .run[!]([]) .usage etc)
  #   #command_names [:this, :that]
  #   #command(:name){ ... } # *define* a command (& returns object)
  #   #command(:name) # return the Command object [no defining block]
  #
  #   #user_commands (subtract the default ones)
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
    pending
    cli = SimpleCLI2::Bin.new
    cli.command_names.should include(:help)
    cli.command_names.should include(:commands)
  end

  it 'commands need to have a _help method' do
    cli = SimpleCLI2::Bin.new
    cli.command_names.should_not include('test')
    cli.instance_eval do
      def test;          end
      def test_help;     end
      def not_a_command; end
    end
    cli.command_names.should     include('test')
    cli.command_names.should_not include('not_a_command')
  end

  it 'should be able to add commands' do
    cli = SimpleCLI2::Bin.new
    cli.command_names.should_not include('test')
    cli.instance_eval do
      def test;          end
      def test_help;     end
    end
    cli.command_names.should include('test')
  end

end
