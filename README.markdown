SimpleCLI
=========

Super Simple RubyGems-like CLI

SimpleCLI gives you a stupidly simple way to implement command-line 
interfaces like that of RubyGems with a basic interface like:

    gem command [options]

SimpleCLI gives you a way of defining your commands (or actions) so 
they'll automatically show up when you run `yourapp commands`

SimpleCLI also makes it really easy to add documentation to each of
your commands (or actions)

Example
-------

Here's a super simple SimpleCLI example:

    #! /usr/bin/env ruby

    require File.dirname(__FILE__) + '/../lib/simplecli'

    class Hello
      include SimpleCLI

      def usage
        puts <<doco

      Hello CLI

        Usage:
          #{ script_name } command [options]
        
        Futher help:
          #{ script_name } commands         # list all available commands
          #{ script_name } help <COMMAND>   # show help for COMMAND
          #{ script_name } help             # show this help message

    doco
      end

      def sayhello_help
        <<doco
    Usage: #{ script_name } sayhello [SAY]

      Arguments:
        SAY:         Something to say (default 'Hello World!')

      Summary:
        Says hello!
    doco
      end
      def sayhello *args
        puts args.empty? ? "Hello World!" : args.join(' ')
      end

    end

    # POSTAMBLE
    if __FILE__ == $0
      Hello.new( ARGV, :default => 'sayhello' ).run
    end

Example usage:

__`$ ./hello-cli`__

    Hello CLI

      Usage:
        hello-cli command [options]
      
      Futher help:
        hello-cli commands         # list all available commands
        hello-cli help <COMMAND>   # show help for COMMAND
        hello-cli help             # show this help message

__`$ ./hello-cli commands`__

    hello-cli commands are:

        DEFAULT COMMAND   sayhello

        commands          List all 'hello-cli' commands
        help              Provide help documentation for a command
        sayhello          Says hello!

    For help on a particular command, use 'hello-cli help COMMAND'.

__`$ ./hello-cli help`__

    Usage: hello-cli help COMMAND

      Summary:
        Provide help documentation for a command

__`$ ./hello-cli help sayhello`__

    Usage: hello-cli sayhello [SAY]

      Arguments:
        SAY:         Something to say (default 'Hello World!')

      Summary:
        Says hello!

__`$ ./hello-cli sayhello`__

    Hello World!

__`$ ./hello-cli sayhello Hi There`__

  Hi There

__`$ ./hello-cli Hi There`__    `# this works because sayhello is configured as the default command`

    Hi There
