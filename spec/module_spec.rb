# frozen_string_literal: true

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

  describe '#check_alt_attribute(file)' do
    it 'returns error statement' do
      expect(check_alt_attribute(['<img src=\"assets/logo.png\">'])).to eql("add alt = \"\" to the img tag on line #{0 + 1}")
    end
  end

  describe '#check_src_attribute(file)' do
    it 'returns error statement' do
      expect(check_src_attribute(['<img alt=\"logo\">'])).to eql("add src = \"\" to the img tag on line #{0 + 1}")
    end
  end

  describe '#check_href_attribute(file)' do
    it 'returns error statement' do
      expect(check_href_attribute(['<a >'])).to eql("add href = \"\" to the a tag on line #{0 + 1}")
    end
  end

  describe '#check_structure(file)' do
    it 'returns error statement' do
      expect(check_structure(File.read('index.html'))).to eql('poor structure check your <html lang=\"en\"> tag')
    end
  end

  describe '#check_Html_semantics' do
    it 'returns error statement' do
      expect(check_Html_semantics('<img src=\"assets/logo.png\">')).to eql('poor semantics')
    end
  end
end
