#:nodoc:
module ChecksModule
  def check_html_semantics(file)
    error_message = ''.dup

    semantics = ['<header>', '</header>', '<main>', '</main>', '<footer>', '</footer>']
    files_string = file.gsub(/\n|\t/, ''.dup)
    semantics.any? { |tag| error_message << 'poor semantics'.dup unless files_string.match(tag) }
    error_message
  end

  def check_alt_attribute(file)
    error_message = ''.dup
    file.each_with_index do |element, index|
      if element.match(/<img/)
        error_message << "add alt = \"\" to the img tag on line #{index + 1}" unless element.match(/alt/)
      end
    end
    error_message
  end

  def check_href_attribute(file)
    error_message = ''.dup
    file.each_with_index do |element, index|
      if element.match(/<a/)
        error_message << "add href = \"\" to the a tag on line #{index + 1}" unless element.match(/href/)
      end
    end
    error_message
  end

  def check_src_attribute(file)
    error_message = ''.dup
    file.each_with_index do |element, index|
      if element.match(/<img/)
        error_message << "add src = \"\" to the img tag on line #{index + 1}".dup unless element.match(/src/)
      end
    end
    error_message
  end

  def check_structure(file)
    error_message = ''.dup

    structure = ['<html lang=\"en\">', '</html>', '<head>', '</head>', '<body>', '</body>']
    file_string = file.gsub(/\n|t/, ''.dup)
    structure.any? { |tag| error_message << "poor structure check your #{tag} tag" unless file_string.match(tag) }
    error_message
  end
end
