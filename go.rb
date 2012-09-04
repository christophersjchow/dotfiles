#!/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby

module Tty extend self
  def blue; bold 34; end
  def magenta; bold 35; end
  def white; bold 39; end
  def red; underline 31; end
  def reset; escape 0; end
  def bold n; escape "1;#{n}" end
  def underline n; escape "4;#{n}" end
  def escape n; "\033[#{n}m" if STDOUT.tty? end
end

class Array
  def shell_s
    cp = dup
    first = cp.shift
    cp.map{ |arg| arg.gsub " ", "\\ " }.unshift(first) * " "
  end
end

def ohai *args
  puts "#{Tty.blue}==>#{Tty.white} #{args.shell_s}#{Tty.reset}"
end

def warn warning
  puts "#{Tty.red}Warning#{Tty.reset}: #{warning.chomp}"
end
 
def system *args
  abort "Failed during: #{args.shell_s}" unless Kernel.system *args
end

def home
  Dir.chdir
end

def getc  # NOTE only tested on OS X
  system "/bin/stty raw -echo"
  if RUBY_VERSION >= '1.8.7'
    STDIN.getbyte
  else
    STDIN.getc
  end
ensure
  system "/bin/stty -raw echo"
end

# Cross-platform way of finding an executable in the $PATH.
#
#   which('ruby') #=> /usr/bin/ruby
def which(cmd)
  exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
  ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
    exts.each { |ext|
      exe = "#{path}/#{cmd}#{ext}"
      return exe if File.executable? exe
    }
  end
  return nil
end

####################################################################### script
abort "Git isn't installed. Please install git." unless which('git')
abort "Don't run this as root!" if Process.uid == 0

ohai "This script will install dotfiles from https://github.com/Soliah/dotfiles:"
puts "#{Tty.blue}#{home}/Coding/dotfiles/...#{Tty.reset}"
puts "#{Tty.blue}#{home}/Coding/dotfiles/zprezto/...#{Tty.reset}"
puts "#{Tty.blue}#{home}/Coding/dotfiles/vim/...#{Tty.reset}"
puts "#{Tty.blue}#{home}/Coding/dotfiles/lftp/...#{Tty.reset}"
puts "\n"

ohai "With these symlinks in your home directory:"
puts "#{Tty.magenta}#{home}/.zprezto#{Tty.reset}#{Tty.reset} -> #{home}/Coding/dotfiles/zprezto"
puts "#{Tty.magenta}#{home}/.lftp#{Tty.reset} -> #{home}/Coding/dotfiles/lftp"
puts "#{Tty.magenta}#{home}/.vim#{Tty.reset} -> #{home}/Coding/dotfiles/vim"
puts "#{Tty.magenta}#{home}/.gemrc#{Tty.reset} -> #{home}/Coding/dotfiles/gemrc"
puts "#{Tty.magenta}#{home}/.gitconfig#{Tty.reset} -> #{home}/Coding/dotfiles/gitconfig"
puts "#{Tty.magenta}#{home}/.gitexclude#{Tty.reset} -> #{home}/Coding/dotfiles/gitexclude"
puts "#{Tty.magenta}#{home}/.gvimrc#{Tty.reset} -> #{home}/Coding/dotfiles/gvimrc"
puts "#{Tty.magenta}#{home}/.hushlogin#{Tty.reset} -> #{home}/Coding/dotfiles/hushlogin"
puts "#{Tty.magenta}#{home}/.rvmrc#{Tty.reset} -> #{home}/Coding/dotfiles/rvmrc"
puts "#{Tty.magenta}#{home}/.screenrc#{Tty.reset} -> #{home}/Coding/dotfiles/screenrc"
puts "#{Tty.magenta}#{home}/.tmux.conf#{Tty.reset} -> #{home}/Coding/dotfiles/tmux.conf"
puts "#{Tty.magenta}#{home}/.rvmrc#{Tty.reset} -> #{home}/Coding/dotfiles/rvmrc"
puts "#{Tty.magenta}#{home}/.vimrc#{Tty.reset} -> #{home}/Coding/dotfiles/vimrc"
puts "#{Tty.magenta}#{home}/.zlogin#{Tty.reset} -> #{home}/Coding/dotfiles/zlogin"
puts "#{Tty.magenta}#{home}/.zlogout#{Tty.reset} -> #{home}/Coding/dotfiles/zlogout"
puts "#{Tty.magenta}#{home}/.zprofile#{Tty.reset} -> #{home}/Coding/dotfiles/zprofile"
puts "#{Tty.magenta}#{home}/.zpreztorc#{Tty.reset} -> #{home}/Coding/dotfiles/zpreztorc"
puts "#{Tty.magenta}#{home}/.zshenv#{Tty.reset} -> #{home}/Coding/dotfiles/zshenv"
puts "#{Tty.magenta}#{home}/.zshrc#{Tty.reset} -> #{home}/Coding/dotfiles/zshrc"

if STDIN.tty?
  puts
  puts "Press enter to continue..."
  c = getc
  # we test for \r and \n because some stuff does \r instead
  abort unless c == 13 or c == 10
end

Dir.mkdir("#{home}/Coding") unless Dir.exists? "#{home}/Coding"

abort "#{home}/Coding/dotfiles directory exists." if Dir.exists? "#{home}/Coding/dotfiles"

Dir.chdir("#{home}/Coding") do
  ohai "Cloning..."
  system "#{which('git')} clone --recursive https://github.com/Soliah/dotfiles"
  puts "\n"
end

Dir.chdir("#{home}/Coding/dotfiles") do
  ohai "Symlinking..."
  Dir.glob("*").each do |file|
    if file != "README.md"
      puts "Symlinking #{file} to #{home}/.#{file}"
      File.symlink("#{home}/Coding/dotfiles/#{file}", "#{home}/.#{file}")
    end
  end
  puts "\n"
end

ohai "Building native extensions for Command-T vim plugin..."
system "/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby #{home}Coding/dotfiles/vim/bundle/vim-command-t/ruby/command-t/extconf.rb"
system "#{which('make')} #{home}Coding/dotfiles/vim/bundle/vim-command-t/ruby/command-t/make"

ohai "Installation successful!"
