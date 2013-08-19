require 'test/unit'
require 'sitemap_reader'

class SitemapReaderTest < Test::Unit::TestCase
  def test_get_urls
     sr = SitemapReader.new(File.dirname(__FILE__) + '/assets/sitemap.xml')

     assert_includes sr.get_urls, {loc: 'http://example.com/page2', lastmod: nil}
     assert_includes sr.get_urls, {loc: 'http://example.com/page1', lastmod: '2013-08-18'}
  end
end
