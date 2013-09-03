require 'nokogiri'
require 'w3c_datetime'

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
	end

	def get_urls
		@doc.css('url').map do |u|
			{
        loc: u.css('loc').first.content,
        lastmod: url_lastmod(u.css('lastmod').first),
        changefreq: url_changefreq(u.css('changefreq').first),
        priority: url_priority(u.css('priority').first)
      }
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

  def url_changefreq(changefreq)
    changefreq.content unless changefreq.nil?
  end

  def url_priority(priority)
    priority.content.to_f unless priority.nil?
  end

  def url_lastmod(lastmod)
    begin
      W3cDatetime::parse(lastmod.content) unless lastmod.nil?
    rescue ArgumentError
    end
  end
end
