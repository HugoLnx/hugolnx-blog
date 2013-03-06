module Infrastructure
  class Postfile
    include Comparable

    attr_reader :path
    attr_reader :title
    attr_reader :id

    def initialize(path)
      filename = File.basename(path).force_encoding("UTF-8")
      @title = title_from filename
      @id = filename[0..2].to_i
    end
    
    def title_from(filename)
      string_beetween_id_prefix_and_extension_of filename
    end

    def string_beetween_id_prefix_and_extension_of(filename)
      match = filename.match /^[0-9]{3}\-(.*)\.html(\..*|)$/
      match[1].force_encoding("UTF-8")
    end

    def <=>(other_postfile)
      @id <=> other_postfile.id
    end
  end
end
