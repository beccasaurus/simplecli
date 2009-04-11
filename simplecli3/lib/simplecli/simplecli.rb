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

    # Get the names of all of the available commands for an object
    #
    # ==== Returns
    # <Array(String)>:: List of command names
    #
    # api: public
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
  # api: public
  def command_names
    SimpleCLI.command_names self
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
    # api: public
    def command_names
      SimpleCLI.command_names self
    end

  end

end
