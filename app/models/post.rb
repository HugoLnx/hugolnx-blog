class Post
  attr_reader :title
  attr_reader :body

  def initialize(title,body)
    @title = title
    @body = body
  end

  def self.find(*args)
    Infraestrutura::PostFactory.build_for_id(*args)
  end
end
