class SitemapController < ApplicationController
  def index
    redirect_to 'https://nusguitarensemble.s3-ap-southeast-1.amazonaws.com/sitemaps/sitemap.xml.gz'
  end
end
