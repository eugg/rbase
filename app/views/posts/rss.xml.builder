xml.instruct! :xml, version: "1.0", encoding: "UTF-8"
xml.rss version: "2.0", "xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title @rss_info[:title]
    xml.description @rss_info[:description]
    xml.link posts_url

    for post in @posts
      xml.item do
        xml.title post.title
        xml.author post.user.email + "(#{post.user.name})"
        for tag in post.tags
          xml.category tag.name_en
        end
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.description post.content
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end