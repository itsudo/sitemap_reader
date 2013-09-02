require 'nokogiri'

# Parse sitemap
#
# Example:
#   >> sm = SitemapReader.new('http://example.com/sitemap.xml').get_urls
#   => [{:loc=>"http://example.com/page1", :lastmod=>"2013-08-18"},{:loc=>"http://example.com/page2", :lastmod=>nil}]
#
# ... or read from file like this:
#   >> sm = SitemapReader.new('./sitemap.xml').get_urls
#   => [{:loc=>"http://example.com/page1", :lastmod=>"2013-08-18"},{:loc=>"http://example.com/page2", :lastmod=>nil}]
class SitemapReader

  # Arguments:
  #   file_or_url: (String)
	def initialize(file_or_url)
		@doc = Nokogiri::XML(get_sitemap(file_or_url))
		@urls= get_urls
	end

	def get_urls
		@doc.css('url').map do |u|
			loc = u.css('loc').first.content
      lastmod = u.css('lastmod').first.content unless u.css('lastmod').first.nil?
      changefreq = u.css('changefreq').first.content unless u.css('changefreq').first.nil?
      priority = url_priority(u.css('priority').first)
			{loc: loc, lastmod: lastmod, changefreq: changefreq, priority: priority}
		end
	end

  private

  def get_sitemap(file_or_url)
    if File.exist?(file_or_url)
      File.open(file_or_url)
    else
      require 'open-uri'
      open(file_or_url)
    end
  end

  def url_priority(priority)
    priority.content.to_f unless priority.nil?
  end
end
