module Infrastructure
  module PostfileFinder
    extend self

    def find_all_in(directory)
      postfiles_regexp = File.join(directory,"*.html")
      Dir[postfiles_regexp]
    end
  end
end
