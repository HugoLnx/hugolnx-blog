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

  class << self
    def find(*args)
      Infraestrutura::PostFactory.build_for_id(*args)
    end

    def all_post_titles_in(directory)
      Infraestrutura::Postfile.find_all_post_titles_in directory
    end

    def id_max_in(directory)
      Infraestrutura::Postfile.find_id_max_in directory
    end
  end
end
