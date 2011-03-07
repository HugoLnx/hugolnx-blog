module Infraestrutura
  module PostFactory
    extend self

    def build_for_id(id, args={})
      path = find_postfile_path(id,args)
      title = title_from path
      postfile_content = read_file_of path
      creation_date = creation_date_from postfile_content
      body = postfile_content.without_first_line.strip
      Post.new(id,title,creation_date,body)
    end

    def build_all_in(directory)
      postfiles_names = all_htmls_in directory
      ids = convert_3_first_numbers_of postfiles_names
      build_all ids, directory
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

    def creation_date_from(content)
      first_line = content.lines.first
      match = first_line.match(/^[cC]reation [dD]ate:(.*)$/)
      creation_date = match[1].strip.to_date
    end

    def all_htmls_in(directory)
      postfiles_regexp = File.join(directory,"*.html")
      postfiles_paths = Dir[postfiles_regexp]
      postfiles_paths.collect{|path| File.basename path}
    end

    def convert_3_first_numbers_of(postfiles_names)
      postfiles_names.collect{|filename| filename[0..2].to_i}
    end

    def build_all(ids,directory)
      ids.sort.reverse.collect{|id| build_for_id(id, :in => directory)}
    end

    def string_beetween_id_prefix_and_extension_of(filename)
      match = filename.match /^[0-9]{3}\-(.*)\.html(\..*|)$/
      match[1]
    end
  end
end
