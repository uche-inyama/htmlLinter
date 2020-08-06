require 'colorize'

#:nodoc:
module ChecksModule
  def check_alt_attribute(file)
    error_message = ''.dup
    file.each_with_index do |element, index|
      if element.match(/<img/)
        error_message << "add alt = \"\" to the img tag on line #{index + 1} \n" unless element.match(/alt/)
      end
    end
    error_message.empty? ? 'test case passed for all the alt attribute' : error_message
  end

  def check_href_attribute(file)
    error_message = ''.dup
    file.each_with_index do |element, index|
      if element.match(/<a/)
        error_message << "add href = \"\" to the a tag on line #{index + 1} \n" unless element.match(/href/)
      end
    end
    error_message.empty? ? 'test case passed for all the href attribute' : error_message
  end

  def check_src_attribute(file)
    error_message = ''.dup
    file.each_with_index do |element, index|
      if element.match(/<img/)
        error_message << "add src = \"\" to the img tag on line #{index + 1} \n" unless element.match(/src/)
      end
    end
    error_message.empty? ? 'test case passed for all the src attribute' : error_message
  end

  def check_tags(file)
    error_message = ''.dup

    file.each_with_index do |element, index|
      arr = element.scan(/<|>/)
      error_message << "fix tags at line #{index + 1} \n" unless (arr.length % 2).zero?
    end

    error_message.empty? ? 'test case passed for checking tags' : error_message
  end
end
