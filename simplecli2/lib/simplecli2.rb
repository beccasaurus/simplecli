$:.unshift File.dirname(__FILE__)

require 'logger'

module SimpleCLI2

  # methods on the SimpleCLI2 module object
  class << self
    attr_accessor :logger
  end

  # defaults for SimpleCLI2 configuration variables
  SimpleCLI2.logger = Logger.new(STDOUT)
  SimpleCLI2.logger.level = Logger::WARN

  attr_reader :commands

  def initialize *args
    SimpleCLI2.logger.debug { "SimpleCLI2#initialize #{ args.inspect }" } 
  end

end

#
# SimpleCLI2::Bin is a class with no definition, 
# except it includes the SimpleCLI2 module.
#
# If you want a basic SimpleCLI2 class, either 
# for testing or ... whatever ... this is it.
#
class SimpleCLI2::Bin
  include SimpleCLI2

  # overrides module's initialize
  def initialize *args
    SimpleCLI2.logger.debug { "SimpleCLI2::Bin#initialize #{ args.inspect }" }
    super # call module's initialize
  end
end
