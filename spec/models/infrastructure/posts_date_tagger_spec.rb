require 'spec_helper'

module Infrastructure
  describe PostsDateTagger do
    describe ".to_hash(posts)" do
      it "create a hash tagging posts by year" do
        # given
        last_year = Date.today.year-1
        previous_last_year = Date.today.year-2
        last_year_posts = [
          stub(:creation_date => Date.new(last_year,1,23)),
          stub(:creation_date => Date.new(last_year,5,15))
        ]
        previous_last_year_posts = [stub(:creation_date => Date.new(previous_last_year,5,15))]
        actual_year_posts = [
          stub(:creation_date => Date.new(Date.today.year,1,20)),
          stub(:creation_date => Date.new(Date.today.year,4,12)),
          stub(:creation_date => Date.new(Date.today.year,4,25))
        ]
        posts = last_year_posts + previous_last_year_posts + actual_year_posts

        # when
        tagged_posts = PostsDateTagger.to_hash posts

        # then
        tagged_posts.should be == {
          Date.today.year => actual_year_posts,
          last_year => last_year_posts,
          previous_last_year => previous_last_year_posts
        }
      end
    end
  end
end
