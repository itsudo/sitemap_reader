require 'minitest/spec'
require 'minitest/autorun'
require 'sitemap_reader'

describe SitemapReader do
  it "can be created with local file as an argument" do
    SitemapReader.new(File.dirname(__FILE__) + '/assets/sitemap.xml').must_be_instance_of SitemapReader
  end

  it "returns parsed sitemap" do
     sr = SitemapReader.new(File.dirname(__FILE__) + '/assets/sitemap.xml')

     assert_includes sr.get_urls, {loc: 'http://example.com/page2', lastmod: nil, changefreq: nil, priority: nil}
     assert_includes sr.get_urls, {loc: 'http://example.com/page1', lastmod: Time.new('2013', '08', '18', '01', '01', nil, '+01:00'), changefreq: 'monthly', priority: 0.8}
  end
end
