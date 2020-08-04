# frozen_string_literal: true

require_relative '../lib/module.rb'

class Linter
  new_module = ChecksModule::HtmlChecks.new

  attr_accessor :file, :file_content

  def initialize(filename)
    @file_content = File.read(filename)
    @file = File.read(filename).split(/\n/)
  end

  def run_all_checks
    puts new_module.check_doctype(@file)
    puts new_module.check_lang(@file)
    puts new_module.check_alt_attribute(@file)
    puts new_module.check_href_attribute(@file)
    puts new_module.check_src_attribute(@file)
    puts new_module.check_structure(@file_content)
    puts new_module.check_Html_semantics(@file_content)
  end
end

Linter.new('index.html').run_all_checks
