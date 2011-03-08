module Infrastructure
  class PostfileContent
    attr_reader :creation_date
    attr_reader :body

    def initialize(path)
      content = File.read(path).strip
      @creation_date = creation_date_from(content)
      @body = body_from(content)
    end

    def creation_date_from(content)
      first_line = content.lines.first
      match = first_line.match(/^[cC]reation [dD]ate:(.*)$/)
      creation_date = match[1].strip.to_date
    end

    def body_from(content)
      content.without_first_line.strip
    end
  end
end
