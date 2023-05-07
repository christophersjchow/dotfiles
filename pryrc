# vim: syntax=ruby filetype=ruby

require 'amazing_print'

AmazingPrint.pry! if defined?(AmazingPrint)

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end
