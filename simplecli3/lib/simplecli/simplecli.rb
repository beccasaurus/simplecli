#
# SimpleCLI doco
#
module SimpleCLI

  # Get the names of all of the availabe commands
  #
  # ==== Returns
  # <Array(String)>:: List of command names
  #
  # api: public
  def command_names
    help_methods    = self.methods.grep /_help$/
    command_methods = self.methods.select do |method_name|
      help_methods.include? "#{ method_name }_help"
    end
  end

end
