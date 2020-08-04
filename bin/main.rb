# !/usr/bin/env ruby
require_relative '../lib/module.rb'

#:nodoc:
class Linter
  include ChecksModule

  attr_accessor :file, :file_content

  def initialize(filename)
    @file_content = File.read(filename)
    @file = File.read(filename).split(/\n/)
  end

  def checks
    puts check_tags(@file)
    puts check_alt_attribute(@file)
    puts check_href_attribute(@file)
    puts check_src_attribute(@file)
    puts check_structure(@file_content)
  end
end

Linter.new('index.html').checks
