# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://nusguitarensemble.herokuapp.com"

require 'aws-sdk-s3'

SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new('nusguitarensemble',
                                                                        aws_access_key_id: ENV['S3_ACCESS_KEY'],
                                                                        aws_secret_access_key: ENV['S3_SECRET_KEY'],
                                                                        aws_region: 'ap-southeast-1'
)
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_host = "https://niibori.s3.amazonaws.com/"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.ping_search_engines('https://nusguitarensemble.com/sitemap')
SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  add root_path, :changefreq => 'daily'
  add events_path, :changefreq => 'weekly'
  add join_us_path, :changefreq => 'yearly'
  add about_path, :changefreq => 'yearly'

  Event.find_each do |event|
    add event_path(event), :changefreq => 'weekly', :lastmod => event.updated_at
  end
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
