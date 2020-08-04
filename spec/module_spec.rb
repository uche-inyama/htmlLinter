require_relative '../lib/module'

RSpec.describe ChecksModule do
  include ChecksModule

  describe '#check_tags(file)' do
    it 'returns error statement' do
      expect(check_tags(['<titlemint.com/sign_up</title>']))
        .to eql("fix tags at line #{0 + 1} ")
    end
  end

  describe '#check_alt_attribute(file)' do
    it 'returns error statement' do
      expect(check_alt_attribute(['<img src=\"assets/logo.png\">']))
        .to eql("add alt = \"\" to the img tag on line #{0 + 1}")
    end
  end

  describe '#check_src_attribute(file)' do
    it 'returns error statement' do
      expect(check_src_attribute(['<img alt=\"logo\">']))
        .to eql("add src = \"\" to the img tag on line #{0 + 1}")
    end
  end

  describe '#check_href_attribute(file)' do
    it 'returns error statement' do
      expect(check_href_attribute(['<a >']))
        .to eql("add href = \"\" to the a tag on line #{0 + 1}")
    end
  end
end
