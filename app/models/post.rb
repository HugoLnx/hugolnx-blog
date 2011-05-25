class Post < ActiveRecord::Base
  has_many :comments

  attr_reader :id
  attr_reader :title
  attr_reader :creation_date
  attr_reader :body

  def initialize(options = {})
    @id = options[:id]
    @title = options[:title]
    @creation_date = options[:creation_date]
    @body = options[:body]
  end

  def body_with_syntax_highlighting
    doc = Nokogiri::HTML(@body)
    doc.search("code").each do |code_tag|
      classes = code_tag['class'].split(' ')
      classes.delete 'syntax'
      language = classes.first
      language = 'scheme' unless CodeRay::Encoders.list.include? classes.first
      node = code_tag.parse "<div class='CodeRay'>#{CodeRay.scan(code_tag.text,language).div(:line_numbers => :table)}</div>"
      code_tag.after node.to_html
      code_tag.remove
    end
    doc.to_html
  end

  class << self
    def find(*args)
      Infrastructure::PostDsl.find_and_build(*args)
    end

    def all_post_titles_in(directory)
      Infrastructure::PostDsl.find_all_post_titles_in directory
    end

    def id_max_in(directory)
      Infrastructure::PostDsl.find_id_max_in directory
    end
  end
end
