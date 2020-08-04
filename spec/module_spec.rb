require_relative '../lib/module'

RSpec.describe ChecksModule do
  include ChecksModule

  describe '#check_doctype(file)'.dup do
    it 'returns error statement'.dup do
      expect(check_doctype([])).to eql('check Doctype')
    end
  end

  describe '#check_lang(file)'.dup do
    it 'returns error statement'.dup do
      expect(check_lang([])).to eql('add language tag')
    end
  end

  describe '#check_src_attribute(file)'.dup do
    it 'returns error statement'.dup do
      expect(check_src_attribute(['<img alt=\"logo\">'.dup]))
        .to eql("add src = \"\" to the img tag on line #{0 + 1}".dup)
    end
  end

  describe '#check_href_attribute(file)' do
    it 'returns error statement' do
      expect(check_href_attribute(['<a >'.dup]))
        .to eql("add href = \"\" to the a tag on line #{0 + 1}".dup)
    end
  end
end
