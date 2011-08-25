require 'spec_helper'

module Infrastructure
  describe PostsDateTagger do
    describe ".to_hash(posts)" do
      it "create a hash tagging posts by year" do
        # given
        last_year = Date.today.year-1
        previous_last_year = Date.today.year-2
        last_year_post1 = stub :creation_date => Date.new(last_year,1,23)
        last_year_post2 = stub :creation_date => Date.new(last_year,5,15)
        previous_last_year_post = stub :creation_date => Date.new(previous_last_year,5,15)
        jan_post = stub :creation_date => Date.new(Date.today.year,1,20)
        april_post1 = stub :creation_date => Date.new(Date.today.year,4,12)
        april_post2 = stub :creation_date => Date.new(Date.today.year,4,25)
        posts = [previous_last_year_post,last_year_post1,last_year_post2,jan_post,april_post1,april_post2]

        # when
        tagged_posts = PostsDateTagger.to_hash posts

        # then
        tagged_posts.should be == {
          Date.today.year => [jan_post,april_post1,april_post2],
          last_year => [last_year_post1, last_year_post2],
          previous_last_year => [previous_last_year_post]
        }
      end
    end
  end
end
