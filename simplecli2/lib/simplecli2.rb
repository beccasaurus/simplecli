$:.unshift File.dirname(__FILE__)

require 'logger'

module SimpleCLI2
  module DSL
    def command *args
      puts "COMMAND #{ args.first.inspect }"
    end

    def testing *args
      puts "HI THERE"
      SimpleCLI2.logger.debug { "SimpleCLI2#testing #{ args.inspect }" }
    end
  end

  # methods on the SimpleCLI2 module object
  class << self
    attr_accessor :logger
    include SimpleCLI2::DSL
  end

  attr_accessor :commands

  def self.included base
    puts "INCLUDED, base => #{ base.inspect }"
    #eigen = (class << self; self; end)
    #puts "SimpleCLI2 eigen(meta)class: #{ eigen.inspect }"
    #base.send :extend, eigen
    base.send :extend, SimpleCLI2::DSL
  end

  # defaults for SimpleCLI2 configuration variables
  SimpleCLI2.logger = Logger.new(STDOUT)
  # SimpleCLI2.logger.level = Logger::WARN
  SimpleCLI2.logger.level = Logger::DEBUG # for development

  testing :foo, :bar # no way!  wow, this works in a module!


  # Work on DSL? ... maybe *after* implementing the regular old methods
  
  command(:help) do |*args|
    usage %{
             This is usage and we will
             indent it correctly and whatnot! }

    actual_logic_goes_here
    and_do_this
    and_that
  end


  # should be initialize with options (if any)
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

  command(:neat) {

  }

end
