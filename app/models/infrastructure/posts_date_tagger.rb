module Infrastructure
  module PostsDateTagger
    extend self

    def to_hash(posts)
      tagged_by_year = posts.group_by{|post| post.creation_date.year}
      tagged_by_year = split_bigger_years(tagged_by_year)
      return tagged_by_year
    end

   private
    def split_bigger_years(tagged_by_year)
      tagged_and_splited = {}
      tagged_by_year.each_pair do |year,posts|
        if posts.size > 6
          posts_splited = split_posts_each(6,posts)
          posts_splited.each_with_index do |posts_part,i|
            tagged_and_splited["#{year}/#{i+1}"] = posts_part
          end
        else
          tagged_and_splited[year] = posts
        end
      end
      return tagged_and_splited
    end

    def split_posts_each(size,posts)
      splited_posts = []
      while posts.size != 0
        splited_posts << posts[0..(size-1)]
        posts = posts.drop size
      end
      return splited_posts
    end
  end
end
