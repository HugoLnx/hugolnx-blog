module Infraestrutura
  module PostFactory
    extend self

    def build_for_id(*args)
      path = find_postfile_path(*args)
      title = title_from path
      body = read_file_of path
      Post.new(title, body)
    end

    def find_postfile_path(id,args={})
      directory = args[:in]
      id_prefix = sprintf('%.3d',id)
      filename_regexp = "#{id_prefix}-*"
      path_regexp = File.join(directory,filename_regexp)
      Dir[path_regexp].first
    end

    def title_from(path)
      post_filename = File.basename path
      string_beetween_id_prefix_and_extension_of post_filename
    end

    def read_file_of(path)
      File.read(path).strip
    end

    def string_beetween_id_prefix_and_extension_of(filename)
      match = filename.match /^[0-9]{3}\-(.*)\.html(\..*|)$/
      match[1]
    end
  end
end
