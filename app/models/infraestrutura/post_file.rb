module Infraestrutura
  class PostFile
    def initialize(path)
      @path = path
    end

    def title_from_filename
      filename = File.basename @path
      title_match = filename.match /^[0-9]{3}\-(.*)\.html(\..*|)$/
      title_match[1].strip
    end

    def read
      File.read(@path).strip
    end

    def self.find(id,args={})
      directory = args[:in]
      self.new Dir[File.join(directory,"#{sprintf('%.3d',id)}-*")].first
    end
  end
end
