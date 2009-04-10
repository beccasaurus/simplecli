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

  end

  # Get the names of all of the availabe commands
  #
  # ==== Returns
  # <Array(String)>:: List of command names
  #
  # api: public
  def command_names
    # extract this puppy out of here?
    help_methods    = self.methods
    help_methods    = help_methods.select {|name| name.start_with?(SimpleCLI.help_prefix) } if SimpleCLI.help_prefix
    help_methods    = help_methods.select {|name| name.end_with?(SimpleCLI.help_suffix)   } if SimpleCLI.help_suffix

    command_methods = self.methods.select do |method_name|
      help_methods.include? "#{ SimpleCLI.help_prefix }#{ method_name }#{ SimpleCLI.help_suffix }"
    end
  end

end
