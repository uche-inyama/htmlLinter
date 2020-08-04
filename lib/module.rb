module ChecksModule

  def check_doctype(file)
    'check Doctype' unless file.include? '<!Doctype html>'    
  end

  def check_lang(file)
    'add language tag' unless file.include?(/<html lang= \"en\">/)
  end

  def check_alt(file)
    error_message = ''
    file.each_with_index do |element, index|
      if element.match(/<img/)
        error_message << "add alt = \"\" to the img tag on line #{index + 1}" unless element.match(/alt/)
      end
    end
    error_message
  end

  def check_href(file)
    error_message = ''
    file.each_with_index do |element, index|
      if element.match(/<a/)
        error_message << "add href = \"\" to the a tag on line #{index + 1}" unless element.match(/href/)
      end
    end
    error_message
  end

  def check_src(file)
    error_message = ''
    file.each_with_index do |element, index|
      if element.match(/<img/)
        error_message << "add src = \"\" to the img tag on line #{index + 1}" unless element.match(/src/)
      end
    end
    error_message
  end

  def check_structure(file)
    error_message = ''

    structure = ['<html lang=\"en\">', '</html>', '<head>', '</head>', '<body>', '</body>']
    file_string = file.gsub(/\n|\t/, '')
    structure.any? { |tag| error_message << "poor structure check your #{tag} tag" unless file_string.match(tag) }
    error_message
  end

  def check_semantics(file)
    error_message = ''

    semantics = ['<header>', '</header>', '<main>', '</main>' '<footer>', '</footer>']
    files_string = file.gsub(/\n|t/, '')
    semantics.any? { |tag| error_message << 'poor semantics' unless files_string.match(tag) }
    error_message
  end
end