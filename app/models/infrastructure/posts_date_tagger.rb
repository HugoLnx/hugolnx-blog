module Infrastructure
  module PostsDateTagger
    extend self

    def to_hash(posts)
      tagged_by_year = posts.group_by{|post| post.creation_date.year}
      return tagged_by_year
    end
  end
end
