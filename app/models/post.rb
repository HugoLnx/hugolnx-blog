class Post
  attr_reader :id
  attr_reader :title
  attr_reader :body

  def initialize(id,title,body)
    @id = id
    @title = title
    @body = body
  end

  def self.find(*args)
    Infraestrutura::PostFactory.build_for_id(*args)
  end

  def self.all_in(*args)
    Infraestrutura::PostFactory.build_all_in(*args)
  end
end
