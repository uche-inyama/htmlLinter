# !/usr/bin/env ruby
require_relative '../lib/module.rb'
require_relative '../lib/file'

#:nodoc:
class Linter < CssFile
  include ChecksModule

  def initialize(filename)
    super
  end

  def checks
    puts check_alt_attribute(@file)
    puts check_src_attribute(@file)
    puts check_href_attribute(@file)
    puts check_tags(@file)
  end
end

Linter.new('index.html').checks
