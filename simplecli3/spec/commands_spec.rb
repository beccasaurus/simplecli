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
    "called regular_method with #{ args.inspect }"
  end
end

describe SimpleCLI, 'commands' do

  it 'should be able to find #command_names (on an instance)' do
    ExampleClass.new.command_names.should     include('command_method')
    ExampleClass.new.command_names.should_not include('regular_method')
  end

  it 'should be able to find #command_names (on a class ... cause, why not?)'

  it 'should be able to change the prefix/suffix for defining the [command]_help method'

end
