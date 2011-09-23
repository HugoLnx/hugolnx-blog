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
      postfiles = paths.collect do |post_path|
        wrap_postfile_from(post_path)
      end
      postfiles = sort_by_indexing_order(postfiles)

      posts = postfiles.collect.with_index do |(file,content),id|
        build(file,content,id+1)
      end
      return posts
    end

    def sort_by_indexing_order(postfiles)
      postfiles.sort do |(file_a,content_a),(file_b,content_b)|
        attrs_a = content_a.catch_attributes
        attrs_b = content_b.catch_attributes
        result = attrs_a[:creation_date] <=> attrs_b[:creation_date]
        result = file_a.location <=> file_b.location if result.zero?
        result = file_a.id <=> file_b.id if result.zero?
        result
      end
    end
  end
end
