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

      it "split year if it have more than 6 posts" do
        # given
        last_year = Date.today.year-1
        last_year_posts = [
          stub(:creation_date => Date.new(last_year,1,23)),
          stub(:creation_date => Date.new(last_year,3,15)),
          stub(:creation_date => Date.new(last_year,5,15)),
          stub(:creation_date => Date.new(last_year,6,15)),
          stub(:creation_date => Date.new(last_year,8,15)),
          stub(:creation_date => Date.new(last_year,10,15)),
          stub(:creation_date => Date.new(last_year,12,15))
        ]

        actual_year_posts = [
          stub(:creation_date => Date.new(Date.today.year,1,20)),
          stub(:creation_date => Date.new(Date.today.year,2,12)),
          stub(:creation_date => Date.new(Date.today.year,7,12)),
          stub(:creation_date => Date.new(Date.today.year,8,12)),
          stub(:creation_date => Date.new(Date.today.year,9,12)),
          stub(:creation_date => Date.new(Date.today.year,11,12)),
          stub(:creation_date => Date.new(Date.today.year,12,25)),
          stub(:creation_date => Date.new(Date.today.year,12,30))
        ]
        posts = last_year_posts + actual_year_posts

        # when
        tagged_posts = PostsDateTagger.to_hash posts

        # then
        tagged_posts.should be == {
          "#{Date.today.year}/1" => actual_year_posts[0..5],
          "#{Date.today.year}/2" => actual_year_posts[6..-1],
          "#{last_year}/1" => last_year_posts[0..5],
          "#{last_year}/2" => last_year_posts[6..-1]
        }
      end


      it "still splitting if year split have more than 6 posts" do
        # given
        actual_year_posts = [
          stub(:creation_date => Date.new(Date.today.year,1,10)),
          stub(:creation_date => Date.new(Date.today.year,1,20)),
          stub(:creation_date => Date.new(Date.today.year,2,20)),
          stub(:creation_date => Date.new(Date.today.year,2,25)),
          stub(:creation_date => Date.new(Date.today.year,3,10)),
          stub(:creation_date => Date.new(Date.today.year,3,30)),
          stub(:creation_date => Date.new(Date.today.year,4,10)),
          stub(:creation_date => Date.new(Date.today.year,4,20)),
          stub(:creation_date => Date.new(Date.today.year,5,5)),
          stub(:creation_date => Date.new(Date.today.year,5,12)),
          stub(:creation_date => Date.new(Date.today.year,6,3)),
          stub(:creation_date => Date.new(Date.today.year,6,12)),
          stub(:creation_date => Date.new(Date.today.year,7,12)),
          stub(:creation_date => Date.new(Date.today.year,7,25)),
          stub(:creation_date => Date.new(Date.today.year,8,10)),
          stub(:creation_date => Date.new(Date.today.year,8,12)),
          stub(:creation_date => Date.new(Date.today.year,9,11)),
          stub(:creation_date => Date.new(Date.today.year,9,12))
        ]

        # when
        tagged_posts = PostsDateTagger.to_hash actual_year_posts

        # then
        tagged_posts["#{Date.today.year}/1"].should have(6).posts
        tagged_posts["#{Date.today.year}/2"].should have(6).posts
        tagged_posts["#{Date.today.year}/3"].should have(6).posts
        tagged_posts.should be == {
          "#{Date.today.year}/1" => actual_year_posts[0..5],
          "#{Date.today.year}/2" => actual_year_posts[6..11],
          "#{Date.today.year}/3" => actual_year_posts[12..-1]
        }
      end

      it 'orders by year decreasingly' do
        # given
        last_year = Date.today.year-1
        last_year_post = stub(:creation_date => Date.new(last_year,9,12))
        actual_year_post = stub(:creation_date => Date.new(Date.today.year,9,12))
        posts = [last_year_post,actual_year_post]

        # when
        tagged_posts = PostsDateTagger.to_hash posts

        # then
        tagged_posts.first.first.should be == Date.today.year
      end

      it 'orders by year decreasingly, keeping semester ordered increasingly' do
        # given
        last_year_posts = [
          stub(:creation_date => Date.new(Date.today.year-1,1,10)),
          stub(:creation_date => Date.new(Date.today.year-1,1,20)),
          stub(:creation_date => Date.new(Date.today.year-1,2,20)),
          stub(:creation_date => Date.new(Date.today.year-1,2,25)),
          stub(:creation_date => Date.new(Date.today.year-1,3,10)),
          stub(:creation_date => Date.new(Date.today.year-1,3,30)),
          stub(:creation_date => Date.new(Date.today.year-1,4,10)),
          stub(:creation_date => Date.new(Date.today.year-1,4,20)),
          stub(:creation_date => Date.new(Date.today.year-1,5,5)),
          stub(:creation_date => Date.new(Date.today.year-1,5,12)),
          stub(:creation_date => Date.new(Date.today.year-1,6,3)),
          stub(:creation_date => Date.new(Date.today.year-1,6,12))
        ]

        actual_year_posts = [
          stub(:creation_date => Date.new(Date.today.year,1,10)),
          stub(:creation_date => Date.new(Date.today.year,1,20)),
          stub(:creation_date => Date.new(Date.today.year,2,20)),
          stub(:creation_date => Date.new(Date.today.year,2,25)),
          stub(:creation_date => Date.new(Date.today.year,3,10)),
          stub(:creation_date => Date.new(Date.today.year,3,30)),
          stub(:creation_date => Date.new(Date.today.year,4,10)),
          stub(:creation_date => Date.new(Date.today.year,4,20)),
          stub(:creation_date => Date.new(Date.today.year,5,5)),
          stub(:creation_date => Date.new(Date.today.year,5,12)),
          stub(:creation_date => Date.new(Date.today.year,6,3)),
          stub(:creation_date => Date.new(Date.today.year,6,12)),
          stub(:creation_date => Date.new(Date.today.year,7,12)),
          stub(:creation_date => Date.new(Date.today.year,7,25)),
          stub(:creation_date => Date.new(Date.today.year,8,10)),
          stub(:creation_date => Date.new(Date.today.year,8,12)),
          stub(:creation_date => Date.new(Date.today.year,9,11)),
          stub(:creation_date => Date.new(Date.today.year,9,12))
        ]

        posts = last_year_posts + actual_year_posts

        # when
        tagged_posts = PostsDateTagger.to_hash posts

        # then
        tagged_posts.keys[0].should be == "#{Date.today.year}/1"
        tagged_posts.keys[1].should be == "#{Date.today.year}/2"
        tagged_posts.keys[2].should be == "#{Date.today.year}/3"
        tagged_posts.keys[3].should be == "#{Date.today.year-1}/1"
        tagged_posts.keys[4].should be == "#{Date.today.year-1}/2"
      end
    end
    
  end
end
