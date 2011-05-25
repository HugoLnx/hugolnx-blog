xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "HugoLnx::Blog"
    xml.description "O blog com tudo sobre programacao"
    xml.link posts_url

    for post in @posts
      xml.item do
        xml.title post.title
        xml.description post.body
        xml.pubDate post.creation_date.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end
