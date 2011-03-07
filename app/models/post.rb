class Post
  attr_reader :title
  attr_reader :body

  def initialize(title,body)
    @title = title
    @body = body
  end

  def self.find(id,args={})
    directory = args[:in]
    html_path = Dir[File.join(directory,"#{sprintf('%.3d',id)}-*")].first
    title_match = File.basename(html_path).match /^[0-9]{3}\-(.*)\.html(\..*|)$/
    title = title_match[1].strip
    body = File.read(html_path).strip
    Post.new title, body
  end
end
