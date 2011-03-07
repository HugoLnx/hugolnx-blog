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

  def self.all_in(*args)
    Infraestrutura::PostFactory.build_all_in(*args)
  end
end
