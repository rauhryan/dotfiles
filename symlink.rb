#!/usr/bin/env ruby

HELP = <<END

   ruby symlink [command]

   	install		Will install using your %HOME% environment variable

	{directory} 	if you don't use the install command you need to specify
			the directory your self. eg; c:\\Users\\MyLogin
END

def print_help
   	puts HELP
	exit
end

print_help if ARGV.empty?

if ARGV.first == "/?"
	print_help
end

Dir.glob("{*,.*}") do |file|
	excludes = [".","..","symlink.rb",".git"]
	home = ARGV.first == "install" ? ENV["HOME"].gsub("/","\\") : ARGV.first
	puts "Symlink #{Dir.pwd.gsub("/","\\")}\\#{file} to #{home}" unless excludes.include? file
	cmd = "mklink #{File.directory?(file) ? "/J" : "/H" } #{home}\\#{file} #{Dir.pwd.gsub("/","\\")}\\#{file}"
	system("call #{cmd}") unless excludes.include? file
end

    
