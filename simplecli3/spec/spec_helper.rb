require File.dirname(__FILE__) + '/../lib/simplecli'

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
