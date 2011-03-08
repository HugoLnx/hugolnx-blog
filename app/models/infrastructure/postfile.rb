module Infrastructure
  class Postfile
    def initialize(id,directory)
      path = find_path(id,directory)
      @filename = File.basename path
      @content = File.read(path).strip
    end
    
    def find_path(id,directory)
      id_prefix = sprintf('%.3d',id)
      filename_regexp = "#{id_prefix}-*"
      path_regexp = File.join(directory,filename_regexp)
      Dir[path_regexp].first
    end

    def title
      self.class.string_beetween_id_prefix_and_extension_of @filename
    end

    def creation_date
      first_line = @content.lines.first
      match = first_line.match(/^[cC]reation [dD]ate:(.*)$/)
      creation_date = match[1].strip.to_date
    end

    def body
      @content.without_first_line.strip
    end

    class << self
      def find_all_post_titles_in(directory)
        postfiles_names = all_htmls_in directory
        postfiles_names.sort!
        postfiles_names.collect{|filename| title_from filename}
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

      def title_from(filename)
        string_beetween_id_prefix_and_extension_of filename
      end

      def convert_3_first_numbers_of(postfiles_names)
        postfiles_names.collect{|filename| filename[0..2].to_i}
      end

      def string_beetween_id_prefix_and_extension_of(filename)
        match = filename.match /^[0-9]{3}\-(.*)\.html(\..*|)$/
        match[1]
      end
    end
  end
end
