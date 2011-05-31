xml.instruct! :xml, :version => "1.0" 
xml.urlset :xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc request.host
    xml.lastmod @posts.last.creation_date.strftime("%Y-%m-%d")
    xml.changefreq 'daily'
    xml.priority '0.8'
  end

  for post in @posts
    xml.url do
      xml.loc post_url(post)
      xml.lastmod post.creation_date.strftime("%Y-%m-%d")
    end
  end
end
