module Infrastructure
  module PostDsl
    extend self

    def wrap_postfile_from(path)
      postfile = Postfile.new(path)
      postfile_content = PostfileContent.new(path)
      return [postfile,postfile_content]
    end

    def build(postfile,postfile_content,id)
      attributes = {
        :id => id,
        :relative_id => postfile.id,
        :title => postfile.title,
        :location => postfile.location
      }.merge!(postfile_content.catch_attributes)

      return Post.new attributes
    end

    def build_all_in(directory)
      paths = PostfileFinder.find_all_in directory
      posts = paths.collect.with_index do |post_path,id|
        postfile, postfile_content = wrap_postfile_from(post_path)
        build(postfile,postfile_content,id)
      end
      return posts
    end
  end
end
