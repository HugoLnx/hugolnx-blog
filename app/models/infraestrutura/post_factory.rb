module Infraestrutura
  module PostFactory
    extend self

    def build_for_id(id, args={})
      directory = args[:in]
      postfile = Postfile.find(id,directory)
      title = postfile.title
      creation_date = postfile.creation_date
      body = postfile.body
      Post.new(id,title,creation_date,body)
    end
  end
end
