require File.dirname(__FILE__) + '/spec_helper'

# NOTE ExampleClass is defined in spec_helper.rb

describe SimpleCLI, 'commands' do

  it 'should be able to find #command_names (on an instance)' do
    ExampleClass.new.command_names.should     include('command_method')
    ExampleClass.new.command_names.should_not include('regular_method')
    ExampleClass.new.command_names.should_not include('custom1')
    ExampleClass.new.command_names.should_not include('custom2')
  end

  it 'should be able to find #command_names (on a class ... cause, why not?)' do
    ExampleClass.command_names.should     include('command_method')
    ExampleClass.command_names.should_not include('regular_method')
    ExampleClass.command_names.should_not include('custom1')
    ExampleClass.command_names.should_not include('custom2')
  end

  it 'should be able to find SimpleCLI#command_names(Class) for any Class that has commands' do
    SimpleCLI.command_names(ExampleClass).should     include('command_method')
    SimpleCLI.command_names(ExampleClass).should_not include('regular_method')
    SimpleCLI.command_names(ExampleClass).should_not include('custom1')
    SimpleCLI.command_names(ExampleClass).should_not include('custom2')
  end

  it 'should be able to find SimpleCLI#command_names(object) for any object that has commands' do
    SimpleCLI.command_names(ExampleClass.new).should     include('command_method')
    SimpleCLI.command_names(ExampleClass.new).should_not include('regular_method')
    SimpleCLI.command_names(ExampleClass.new).should_not include('custom1')
    SimpleCLI.command_names(ExampleClass.new).should_not include('custom2')
  end

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

  it 'should be able to get the name of a help method (#help_method_name)' do
    default_prefix, default_suffix = SimpleCLI.help_prefix, SimpleCLI.help_suffix

    SimpleCLI.help_prefix = 'documentation_for_'
    SimpleCLI.help_suffix = nil
    SimpleCLI.help_method_name('foo').should == 'documentation_for_foo'

    SimpleCLI.help_suffix = '_stuff'
    SimpleCLI.help_method_name('foo').should == 'documentation_for_foo_stuff'
    
    SimpleCLI.help_prefix, SimpleCLI.help_suffix = default_prefix, default_suffix
  end

end
