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
  Dir.home
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

ohai "This script will install dotfiles from https://github.com/Soliah/dotfiles"

if STDIN.tty?
  puts
  puts "Press enter to continue..."
  c = getc
  # we test for \r and \n because some stuff does \r instead
  abort unless c == 13 or c == 10
end

Dir.mkdir("#{home}/Coding") unless Dir.exists? "#{home}/Coding"

if !Dir.exists? "#{home}/Coding/dotfiles"
  Dir.chdir("#{home}/Coding") do
    ohai "Cloning dotfiles..."
    system "#{which('git')} clone --recursive https://github.com/Soliah/dotfiles"

    ohai "Cloning vundle..."
    Dir.chdir("#{home}/Coding/dotfiles")
    system "#{which('git')} clone --recursive https://github.com/gmarik/vundle.git vim/bundle"
    puts "\n"
  end
end

Dir.chdir("#{home}/Coding/dotfiles") do
  ohai "Symlinking..."
  (Dir.glob("*").concat(%w{ vim ssh })).each do |file|
    if file != "README.md" && file != "go.rb"
      if File.exists?("#{home}/.#{file}")
        File.unlink("#{home}/.#{file}")
      end

      puts "Symlinking #{file} to #{home}/.#{file}"
      File.symlink("#{home}/Coding/dotfiles/#{file}", "#{home}/.#{file}")
    end
  end
  puts "\n"
end

ohai "Installation successful!"
