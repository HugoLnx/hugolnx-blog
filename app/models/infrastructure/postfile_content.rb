module Infrastructure
  class PostfileContent
    ANNOTATION_REGEXPS = {
      :creation_date => /[cC]reation [dD]ate:/,
      :keywords => /[kK]eywords:/,
      :tags => /[tT]ags:/
    }

    def initialize(path)
      @content = File.read(path).strip
    end

    def catch_attributes
      all_attributes = {:body => catch_body}
      ANNOTATION_REGEXPS.each do |attribute,regexp|
        data = extract_data regexp
        value = trate_data_of(attribute,data)
        all_attributes[attribute] = value
      end
      return all_attributes
    end

  private
    def catch_body
      body = @content.clone
      ANNOTATION_REGEXPS.each_value do |regexp|
        body.slice!(/#{regexp}.*\n/)
      end
      return body
    end

    def extract_data(regexp)
      match = @content.match(/#{regexp}([^\n]*)/)
      return $1 || ""
    end

    def trate_data_of(attribute,data)
      return send("trate_#{attribute}_data",data.strip)
    end

    def trate_creation_date_data(data)
      data.to_date
    end

    def trate_keywords_data(data)
      data.split ' '
    end
    alias trate_tags_data trate_keywords_data
  end
end
