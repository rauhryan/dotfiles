#!/usr/bin/env ruby
def print_help
   	puts "USAGE: /> ruby symlink.rb {Destination Directory}"
	exit
end

print_help if ARGV.empty?

if ARGV.first == "/?"
	print_help
end


Dir.glob("{*,.*}") do |file|
	excludes = [".","..","symlink.rb",".git"]
	puts "Symlink #{Dir.pwd.gsub("/","\\")}\\#{file} to #{ARGV.first}" unless excludes.include? file
	cmd = "mklink #{File.directory?(file) ? "/J" : "/H" } #{ARGV.first}\\#{file} #{Dir.pwd.gsub("/","\\")}\\#{file}"
	system("call #{cmd}") unless excludes.include? file
end

    
