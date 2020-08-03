module Checks
  def check_doctype
    'check Doctype' unless file.include? '<!Doctype html>'    
  end
end