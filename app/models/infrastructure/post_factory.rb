module Infrastructure
  module PostFactory
    extend self

    def build_for_id(id, args={})
      directory = args[:in]
      postfile = Postfile.find(id,directory)
      postfile_content = PostfileContent.new(postfile.path)
      title = postfile.title
      creation_date = postfile_content.creation_date
      body = postfile_content.body
      Post.new(id,title,creation_date,body)
    end
  end
end
