require_relative '../lib/module'

RSpec.describe ChecksModule do
  include ChecksModule

  describe '#check_html_semantics'.dup do
    it 'returns error statement'.dup do
      expect(check_html_semantics('<img src=\"assets/logo.png\".dup>'.dup))
        .to eql('poor semantics'.dup)
    end
  end

  describe '#check_alt_attribute(file)'.dup do
    it 'returns error statement'.dup do
      expect(check_alt_attribute(['<img src=\"assets/logo.png\">'.dup]))
        .to eql("add alt = \"\" to the img tag on line #{0 + 1}".dup)
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
