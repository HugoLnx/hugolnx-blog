module Infrastructure
  module PostfileFinder
    extend self

    def find_all_in(directory)
      postfiles_regexp = File.join(directory,"*.html")
      Dir[postfiles_regexp]
    end

    def find(id,directory)
      id_prefix = sprintf('%.3d',id)
      filename_regexp = "#{id_prefix}-*"
      path_regexp = File.join(directory,filename_regexp)
      Dir[path_regexp].first
    end
  end
end
