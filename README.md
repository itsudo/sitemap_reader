# sitemap_reader

[![Build Status](https://travis-ci.org/itsudo/sitemap-reader.png)](https://travis-ci.org/itsudo/sitemap-reader)

Ruby library for reading sitemaps

## Installation

Add this line to your application's Gemfile:

    gem 'sitemap_reader'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sitemap_reader

## Usage

    require 'sitemap_reader'

    sm = SitemapReader.new('http://example.com/sitemap.xml')
    sm.get_urls

will return list of ruby hashes representing urls

    [
      {
        :loc=>"http://example.com/page1",
        :lastmod=>"2013-08-17 23:00:00",
        :changefreq=>'monthly',
        :priority=>0.8
      },
      {
        :loc=>"http://example.com/page2",
        :lastmod=>nil,
        :changefreq=>nil,
        :priority=>nil
      }
    ]

The `loc` attribute of the url in the sitemap cannot be empty, but the rest can be nil if not set or can't be parsed.

## TODO
  
  * optimize code for large sitemaps
  * read sitemapindexes
  * create benchmark tests

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
