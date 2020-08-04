require_relative '../lib/module'

RSpec.describe ChecksModule do
  include ChecksModule

  describe '#check_doctype(file)' do
    it 'returns error statement' do
      expect(check_doctype([])).to eql('check Doctype')
    end
  end

  describe '#check_lang(file)' do
    it 'returns error statement' do
      expect(check_lang([])).to eql('add language tag')
    end
  end

  describe '#check_alt(file)' do
    it 'returns error statement' do
      expect(check_alt(['<img src=\"assets/logo.png\">'])).to eql("add alt = \"\" to the img tag on line #{0 + 1}")
    end
  end

   describe '#check_alt(file)' do
    it 'returns error statement' do
      expect(check_alt(['<img src=\"assets/logo.png\">'])).to eql("add alt = \"\" to the img tag on line #{0 + 1}")
    end
  end

  describe '#check_structure(file)'do
    it 'returns error statement' do
      expect(check_structure(File.read('index.html'))).to eql('poor structure check your <html lang=\"en\"> tag')
    end
  end

  describe '#check_semantics' do
    it 'returns error statement' do
      expect(check_semantics('<img src=\"assets/logo.png\">')).to eql('poor semantics')
    end
  end
end