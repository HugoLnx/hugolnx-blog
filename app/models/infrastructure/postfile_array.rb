module Infrastructure
  class PostfileArray
    def initialize(postfiles)
      @postfiles = postfiles.sort!
    end

    def titles
      @postfiles.collect{|postfile| postfile.title}
    end

    def newer
      @postfiles.max
    end
  end
end
