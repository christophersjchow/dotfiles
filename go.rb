#!/usr/bin/env ruby

require 'fileutils'

Dir.chdir File.dirname(__FILE__) do
  puts 'Symlinking...'
  Dir.glob('**').each do |file|
    unless %w(go.rb README.md gitconfig.sample base16-tomorrow.dark.itermcolors).include?(file)
      puts "Symlinking #{file} to #{File.dirname(__FILE__)}/#{file}"
      FileUtils.ln_s(File.expand_path(File.join(File.dirname(__FILE__), file)),
                     "#{ENV["HOME"]}/.#{file}", :force => true)
    end
  end

  %x[git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle]
end
