class SitemapsController < ApplicationController
  def index
    render :file=>"/sitemap.xml", :content_type => 'application/xml'
  end
end