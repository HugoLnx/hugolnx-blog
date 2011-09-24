xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "HugoLnx::Blog"
    xml.description "O blog com tudo sobre programacao"
    xml.pubDate "Fri, 25 May 2011 00:00:00 +0000"
    xml.lastBuildDate "Fri, 10 Jun 2011 00:00:00 +0000"
    xml.link posts_url

    for post in @posts
      xml.item do
        xml.title post.title
        xml.description post.body_with_syntax_highlighting
        xml.pubDate post.creation_date.strftime("%a, %d %b %Y %H:%M:%S %z")
        xml.lastBuildDate post.last_modification_date.strftime("%a, %d %b %Y %H:%M:%S %z") unless post.last_modification_date.nil?
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end

    for post in @other_posts
      xml.item do
        xml.title post.title
        xml.description post.body_with_syntax_highlighting
        xml.pubDate post.creation_date.strftime("%a, %d %b %Y %H:%M:%S %z")
        xml.lastBuildDate post.last_modification_date.strftime("%a, %d %b %Y %H:%M:%S %z") unless post.last_modification_date.nil?
        xml.link other_post_url(post.location,post.friendly_title)
        xml.guid other_post_url(post.location,post.friendly_title)
      end
    end
  end
end
