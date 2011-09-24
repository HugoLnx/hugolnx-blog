xml.instruct! :xml, :version => "1.0" 
xml.urlset :xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc "http://#{request.host}"
    post = @posts.last
    last_mod = post.last_modification_date || post.creation_date
    xml.lastmod last_mod.strftime("%Y-%m-%d")
    xml.changefreq 'daily'
    xml.priority '0.8'
  end

  for post in @posts
    xml.url do
      xml.loc post_url(post)
      last_mod = post.last_modification_date || post.creation_date
      xml.lastmod last_mod.strftime("%Y-%m-%d")
    end
  end

  for post in @other_posts
    xml.url do
      xml.loc other_post_url(post.location,post.friendly_title)
      last_mod = post.last_modification_date || post.creation_date
      xml.lastmod last_mod.strftime("%Y-%m-%d")
    end
  end
end
