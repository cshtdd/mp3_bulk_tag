#!/usr/bin/env ruby

DEBUG_LOG = ARGV.include?('--debug')

def log_info(str)
  puts str
end

def log_debug(str)
  log_info(str) if DEBUG_LOG
end

input_folder = ARGV[0]
author = ARGV[1]
album = ARGV[2]

log_debug 'Starting program...'

log_debug "input_folder=#{ARGV[0]}"
log_debug "author=#{ARGV[1]}"
log_debug "album=#{ARGV[2]}"

raise 'Input not found' unless Dir.exist?(input_folder)
raise 'Invalid author' if author.empty?
raise 'Invalid album' if album.empty?

Dir["#{input_folder}/*"]
  .select {|f| !File.directory? f}
  .each do |f|
    log_debug "Processing #{f}"
  end
