module Infrastructure
  module PostDsl
    extend self

    def find(id,args={})
      directory = args[:in]
      path = PostfileFinder.find(id,directory)
      postfile = Postfile.new(path)
      postfile_content = PostfileContent.new(path)
      return [postfile,postfile_content]
    end

    def build(postfile,postfile_content)
      attributes = {
        :id => postfile.id,
        :title => postfile.title
      }.merge!(postfile_content.catch_attributes)

      return Post.new attributes
    end

    def find_all_in(directory)
      posts = []
      id = 1
      post = PostfileFinder.find(id, directory)
      until post.nil?
        posts << build(*find(id, :in => directory))
        id += 1
        post = PostfileFinder.find(id, directory)
      end
      return posts
    end
  end
end
