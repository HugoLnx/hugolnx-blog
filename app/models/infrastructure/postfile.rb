module Infrastructure
  class Postfile
    include Comparable

    attr_reader :path
    attr_reader :title
    attr_reader :id

    def initialize(id,directory)
      @path = find_path(id,directory)
      filename = File.basename path
      @title = title_from filename
      @id = id.to_i
    end
    
    def find_path(id,directory)
      id_prefix = sprintf('%.3d',id)
      filename_regexp = "#{id_prefix}-*"
      path_regexp = File.join(directory,filename_regexp)
      Dir[path_regexp].first
    end

    def title_from(filename)
      string_beetween_id_prefix_and_extension_of filename
    end

    def string_beetween_id_prefix_and_extension_of(filename)
      match = filename.match /^[0-9]{3}\-(.*)\.html(\..*|)$/
      match[1]
    end

    def <=>(other_postfile)
      @id <=> other_postfile.id
    end

    class << self
      def find_all_post_titles_in(directory)
        postfiles_names = all_htmls_in directory
        ids = convert_3_first_numbers_of postfiles_names
        postfiles = ids.collect{|id| new(id,directory)}
        postfiles.sort!
        postfiles.collect{|postfile| postfile.title}
      end

      def find_id_max_in(directory)
        postfiles_names = all_htmls_in directory
        ids = convert_3_first_numbers_of postfiles_names
        ids.max
      end

      def find(id,directory)
        new(id,directory)
      end

      def all_htmls_in(directory)
        postfiles_regexp = File.join(directory,"*.html")
        postfiles_paths = Dir[postfiles_regexp]
        postfiles_paths.collect{|path| File.basename path}
      end

      def convert_3_first_numbers_of(postfiles_names)
        postfiles_names.collect{|filename| filename[0..2].to_i}
      end
    end
  end
end
