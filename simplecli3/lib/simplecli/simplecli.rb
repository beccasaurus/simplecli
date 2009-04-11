#
# SimpleCLI doco
#
module SimpleCLI

  # instance methods on the SimpleCLI module, callable as SimpleCLI.method
  class << self
    
    # The prefix/suffix used for discovering commands.
    #
    # Default: '_help' suffix, nil prefix
    #
    # :api: public
    attr_accessor :help_prefix, :help_suffix

    SimpleCLI.help_suffix ||= '_help'

    # Get the name for a help method, given a method name
    #
    # Simply generates a string - does not guarantee that the method 
    # actually exists on any object.
    #
    # ==== Parameters
    # <~to_s>:: The name of the method you want to get the help method name for
    #
    # ==== Returns
    # String:: The name that a help method would have for the given name
    #
    # :api: public
    def help_method_name name
      "#{ SimpleCLI.help_prefix }#{ name }#{ SimpleCLI.help_suffix }"
    end

    # Get the names of all of the available commands for an object
    #
    # ==== Returns
    # <Array(String)>:: List of command names
    #
    # ==== Notes
    # For now, we only work with instance methods on Class objects
    #
    # This has limitations.  For instance, your Class may have its 
    # own command methods.  Currently, this is unsupported!
    #
    # ==== Usage
    #
    #   >> SimpleCLI.commands MySimpleCLIClass
    #   => [ ... MySimpleCLIClass's instance method commands ... ]
    #
    #   >> SimpleCLI.commands @instance_of_MySimpleCLIClass
    #   => [ ... MySimpleCLIClass's instance method commands ... ]
    #
    # :api: public
    def command_names object_with_commands
      methods = object_with_commands.is_a?(Class) ? 
                  object_with_commands.instance_methods :
                  object_with_commands.methods

      help_methods = methods
      help_methods = help_methods.select {|name| name.start_with?(SimpleCLI.help_prefix) } if SimpleCLI.help_prefix
      help_methods = help_methods.select {|name| name.end_with?(  SimpleCLI.help_suffix) } if SimpleCLI.help_suffix

      command_methods = methods.select do |method_name|
        help_methods.include? "#{ SimpleCLI.help_prefix }#{ method_name }#{ SimpleCLI.help_suffix }"
      end
    end
  end

  # Get the names of all of the available commands
  #
  # ==== Returns
  # <Array(String)>:: List of command names
  #
  # :api: public
  def command_names
    SimpleCLI.command_names self
  end

  # Get Command objects for the given instance
  #
  # ==== Returns
  # Array(Command)::
  #   The Command objects for this Class instance.
  #
  #   The returned Command objects should be fully #call'able 
  #   and should have #documentation and a #summary, etc.
  #
  # :api: public
  def commands
    Command.commands self
  end

  # Gets a particular Command for this Class instnace by name
  #
  # ==== Parameters
  # <~to_s>:: The name of the Command you want returned
  #
  # ==== Returns
  # Command:: The Command found (or nil)
  #
  # :api: public
  def command name
    Command.command self, name
  end

  # the logic performed when SimpleCLI is included, as a module
  def self.included base
    base.extend ClassMethods
  end

  # a module we extend your class with when you include SimpleCLI
  module ClassMethods
    
    # Get the names of all of the available commands for instances of this Class
    #
    # ==== Returns
    # <Array(String)>:: List of command names
    #
    # :api: public
    def command_names
      SimpleCLI.command_names self
    end

  end

end
