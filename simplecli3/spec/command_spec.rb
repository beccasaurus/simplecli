require File.dirname(__FILE__) + '/spec_helper'

# NOTE ExampleClass is defined in spec_helper.rb

# alias Command to make it easier to work with here
Command = SimpleCLI::Command

describe SimpleCLI::Command do

  it 'should #call the actual method' do
    cmd = ExampleClass.new.commands.find {|cmd| cmd.name == 'command_method' }
    cmd.call(1, 2, 3).should     == ExampleClass.new.command_method(1, 2, 3)
    cmd.call(1, 2, 3).should_not == ExampleClass.new.command_method(1, 2, 3, 4, 5, 6)
  end

  it 'should have the right #documentation' do
    cmd = ExampleClass.new.commands.find {|cmd| cmd.name == 'command_method' }
    cmd.documentation.should == ExampleClass.new.command_method_help
  end

  it 'should be able to find #commands (on an instance)' do
    ExampleClass.new.commands.map(&:name).should     include('command_method')
    ExampleClass.new.commands.map(&:name).should_not include('regular_method')
  end

  it 'should be able to find Command#commands(Class) on a Class with commands'

  it 'should be able to get a particular Command for an instance that has commands' do
    Command.command(ExampleClass.new, :regular_method).should     be_nil
    Command.command(ExampleClass.new, :command_method).should_not be_nil
    Command.command(ExampleClass.new, :command_method).documentation.should == ExampleClass.new.command_method_help

    ExampleClass.new.command(:regular_method).should     be_nil
    ExampleClass.new.command(:command_method).should_not be_nil
    ExampleClass.new.command(:command_method).documentation.should == ExampleClass.new.command_method_help
  end

  it 'should be able to #run' do
    pending "hmmm ...."
    cmd = ExampleClass.new.command :command_method
  end

  it 'should be able to #run!'

  it 'should be able to find Command#commands(instance) on an instance with commands' do
    Command.commands(ExampleClass.new).map(&:name).should     include('command_method')
    Command.commands(ExampleClass.new).map(&:name).should_not include('regular_method')
  end

  it 'should have a name' do
    Command.new.name.should be_nil
    Command.new( :name => 'w00t' ).name.should == 'w00t'
  end

  it 'should have a proc' do
    a_proc = lambda { }
    Command.new( :proc => a_proc ).proc.should == a_proc
  end

  it 'should have a summary' do
    Command.new.summary.should be_nil

    Command.new( :summary => 'hi!' ).summary.should == 'hi!'

    Command.new( :documentation => 'foo' ).summary.should be_nil
    Command.new( :documentation => "Hi\nSummary: hi from summary" ).summary.should == 'hi from summary'
    Command.new( :documentation => "Hi\nSummary:\n  hi from summary" ).summary.should == 'hi from summary'
    Command.new( :documentation => "Hi\nSummary:\nhi from summary\n\n" ).summary.should == 'hi from summary'
  end

  it 'should have documentation' do
    Command.new.documentation.should be_nil
    Command.new( :documentation => 'foo' ).documentation.should == 'foo'
  end

  it 'should be callable (with args)' do # should be able to #call and it'll run its proc
    cmd = Command.new :proc => lambda {|*args| "called with #{ args.inspect }" }
    cmd.call(5).should == "called with [5]"
  end

end
