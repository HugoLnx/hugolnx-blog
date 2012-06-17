module Infrastructure
  class Postfile
    include Comparable

    attr_reader :path
    attr_reader :title
    attr_reader :id
    attr_reader :location

    def initialize(path)
      filename = File.basename path
      @title = title_from(filename).force_encoding('utf-8')
      @id = filename[0..2].to_i
      @location = File.dirname(path).match(/^#{File.join(Post::POSTS_DIRECTORY,'(.*)')}/)[1]
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
  end
end
