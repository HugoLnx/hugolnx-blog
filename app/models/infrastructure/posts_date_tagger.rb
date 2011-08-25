module Infrastructure
  module PostsDateTagger
    extend self

    def to_hash(posts)
      tagged_by_year = posts.group_by{|post| post.creation_date.year}
      actual_year_posts = tagged_by_year.delete(Date.today.year)
      tagged_by_actual_year_months = group_by_month actual_year_posts
      posts_tagged = tagged_by_year.merge tagged_by_actual_year_months
      return posts_tagged
    end

  private
    def group_by_month(posts)
      posts.group_by{|post| post.creation_date.month}
    end
  end
end
