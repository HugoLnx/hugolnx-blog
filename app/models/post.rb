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
