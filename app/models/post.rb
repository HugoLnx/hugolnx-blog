class Post
  attr_reader :title
  attr_reader :body

  def initialize(title,body)
    @title = title
    @body = body
  end

  def self.find(id,args={})
    directory = args[:in]
    post_file = Infraestrutura::PostFile.find id, :in => directory
    title = post_file.title_from_filename
    body = post_file.read
    Post.new title, body
  end
end
