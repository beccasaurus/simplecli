$:.unshift File.dirname(__FILE__)

module SimpleCLI2
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
end
