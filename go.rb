#!/usr/bin/env ruby

require "fileutils"

META_FILES = %w(go.rb README.md gitconfig.sample)

Dir.chdir File.dirname(__FILE__) do
  puts "Symlinking..."

  Dir.glob("*").each do |file|
    unless META_FILES.include?(file)
      puts "Symlinking #{file} to #{File.dirname(__FILE__)}/#{file}"

      FileUtils.ln_s(File.expand_path(File.join(File.dirname(__FILE__), file)), "#{ENV["HOME"]}/.#{file}", :force => true)
    end
  end

  %x[curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim]
end
