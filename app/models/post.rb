class Post < ActiveRecord::Base
  has_many :comments

  attr_reader :id
  attr_reader :title
  attr_reader :creation_date
  attr_reader :last_modification_date
  attr_reader :body
  attr_reader :keywords
  attr_reader :tags
  attr_reader :description

  @all = FakeDatabaseInitializer::PostsDatabase.all

  def initialize(options = {})
    @id = options[:id]
    @title = options[:title]
    @creation_date = options[:creation_date]
    @last_modification_date = options[:last_modification_date]
    @body = options[:body]
    @keywords = options[:keywords]
    @tags = options[:tags]
    @description = options[:description]
  end

  def body_with_syntax_highlighting
    doc = Nokogiri::HTML(@body)
    doc.search("code").each do |code_tag|
      classes = code_tag['class'].split(' ')
      classes.delete 'syntax'
      language = classes.first
      language = 'java_script' if language == 'javascript'
      language = 'scheme' unless CodeRay::Scanners.list.include? language
      node = code_tag.parse "<div class='CodeRay'>#{CodeRay.scan(code_tag.text,language).div(:line_numbers => :table)}</div>"
      node.search("*").each do |tag|
        unless tag['style'].nil?
          tag['style'] = tag['style'].gsub(/background(|-color):.*;/,'')
                                     .gsub(/color:.*black/,'color:#aaf')
                                     .gsub(/font-weight:.*bold(|;)/,'')
                                     .gsub(/color:*#888/,'color: #454')
        end
      end
      code_tag.after node.to_html
      code_tag.remove
    end

    doc.to_html
  end

  def friendly_title
    @title.to_slug.normalize.to_s
  end

  def friendly_id
    "#{@id}-#{friendly_title}"
  end

  def to_param
    friendly_id
  end

  alias inspect to_s


  class << self
    def all
      @all
    end

    def find(id,args_to_active_record={})
      search_result = all.find{|post| post.id == id.to_i}
      if search_result.nil?
        raise Infrastructure::PostException,
              Infrastructure::PostException::PostNotFoundedMessage
      else
        return search_result
      end
    end
    
    def last
      all.max_by{|post| post.id.to_i}
    end

  end
end
