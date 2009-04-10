require File.dirname(__FILE__) + '/spec_helper'

class ExampleClass
  include SimpleCLI

  def command_method *args
    "called command_method with #{ args.inspect }"
  end
  def command_method_help
    "Hello from command_method Help\n\nSummary:\n  command_method is the coolest"
  end

  def regular_method *args
  end
  
  # uses custom prefix
  def custom1; end
  def documentation_for_custom1; end

  # used custom prefix and suffix
  def custom2; end
  def documentation_for_custom2_stuff; end
end

describe SimpleCLI, 'commands' do

  it 'should be able to find #command_names (on an instance)' do
    ExampleClass.new.command_names.should     include('command_method')
    ExampleClass.new.command_names.should_not include('regular_method')
    ExampleClass.new.command_names.should_not include('custom1')
    ExampleClass.new.command_names.should_not include('custom2')
  end

  it 'should be able to find #command_names (on a class ... cause, why not?)'

  it 'should be able to change the prefix/suffix for defining the [command]_help method' do
    default_prefix, default_suffix = SimpleCLI.help_prefix, SimpleCLI.help_suffix

    SimpleCLI.help_prefix = 'documentation_for_'
    SimpleCLI.help_suffix = nil

    ExampleClass.new.command_names.should     include('custom1')
    ExampleClass.new.command_names.should_not include('command_method')
    ExampleClass.new.command_names.should_not include('regular_method')
    ExampleClass.new.command_names.should_not include('custom2')

    SimpleCLI.help_suffix = '_stuff'
    ExampleClass.new.command_names.should     include('custom2')
    ExampleClass.new.command_names.should_not include('command_method')
    ExampleClass.new.command_names.should_not include('regular_method')
    ExampleClass.new.command_names.should_not include('custom1')

    SimpleCLI.help_prefix, SimpleCLI.help_suffix = default_prefix, default_suffix
  end

end
