require_relative '../lib/module.rb'

class Linter
  include ChecksModule

  attr_accessor :file, :file_content

  def initialize(filename)
    @file_content = File.read(filename)
    @file = File.read(filename).split(/\n/)
  end

  def run_all_checks
    puts check_doctype(@file)
    puts check_lang(@file)
    puts check_alt_attribute(@file)
    puts check_href_attribute(@file)
    puts check_src_attribute(@file)
    puts check_structure(@file_content)
    puts check_Html_semantics(@file_content)
  end
end

Linter.new('index.html').run_all_checks