module Infrastructure
  module PostfileFinder
    extend self
    DEFAULT_DIRECTORY = 'app/views/posts/posts'

    def find_all_in(directory)
      postfiles_regexp = File.join(directory,"*.html")
      Dir[postfiles_regexp]
    end

    def find(id,directory)
      directory ||= DEFAULT_DIRECTORY
      id_prefix = sprintf('%.3d',id)
      filename_regexp = "#{id_prefix}-*"
      path_regexp = File.join(directory,filename_regexp)
      path = Dir[path_regexp].first
      raise PostException, PostException::PostNotFoundedMessage if path.nil?
      path
    end
  end
end
