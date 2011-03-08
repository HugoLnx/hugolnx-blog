module Infrastructure
  module PostDsl
    extend self

    def find_and_build(id,args={})
      directory = args[:in]
      path = PostfileFinder.find(id,directory)
      postfile = Postfile.new(path)
      postfile_content = PostfileContent.new(path)
      title = postfile.title
      creation_date = postfile_content.creation_date
      body = postfile_content.body
      Post.new(id,title,creation_date,body)
    end

    def find_all_post_titles_in(directory)
      postfiles = array_of_postfiles_in directory
      postfiles.titles
    end

    def find_id_max_in(directory)
      postfiles = array_of_postfiles_in directory
      postfiles.newer.id
    end

    def array_of_postfiles_in(directory)
      paths = PostfileFinder.find_all_in directory
      postfiles = paths.collect{|path| Postfile.new path}
      PostfileArray.new postfiles
    end
  end
end
