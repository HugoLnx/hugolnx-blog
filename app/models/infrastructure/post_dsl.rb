module Infrastructure
  module PostDsl
    extend self

    def wrap_postfile_from(path)
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
      paths = PostfileFinder.find_all_in directory
      posts = paths.collect do |post_path|
        postfile, postfile_content = wrap_postfile_from(post_path)
        build(postfile,postfile_content)
      end
      return posts
    end
  end
end
