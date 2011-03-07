class Post
  attr_reader :id
  attr_reader :title
  attr_reader :creation_date
  attr_reader :body

  def initialize(id,title,creation_date,body)
    @id = id
    @title = title
    @creation_date = creation_date
    @body = body
  end

  def self.find(*args)
    Infraestrutura::PostFactory.build_for_id(*args)
  end

  def self.all_in(*args)
    Infraestrutura::PostFactory.build_all_in(*args)
  end
end
