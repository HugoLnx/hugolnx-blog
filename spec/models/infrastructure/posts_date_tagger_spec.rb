require 'spec_helper'

module Infrastructure
  describe PostsDateTagger do
    describe ".to_hash(posts)" do
      it "create a hash tagging posts by year" do
        # given
        last_year = Date.today.year-1
        previous_last_year = Date.today.year-2
        last_year_posts = [
          stub(:creation_date => Date.new(last_year,1,23))
        ]
        previous_last_year_posts = [
          stub(:creation_date => Date.new(previous_last_year,5,15))
        ]
        actual_year_posts = [
          stub(:creation_date => Date.new(Date.today.year,1,20))
        ]
        posts = last_year_posts + previous_last_year_posts + actual_year_posts

        # when
        tagged_posts = PostsDateTagger.to_hash posts

        # then
        tagged_posts.should have_key Date.today.year.to_s
        tagged_posts.should have_key last_year.to_s
        tagged_posts.should have_key previous_last_year.to_s
      end

      it 'is ordered by year decreasingly' do
        # given
        last_year = Date.today.year-1
        last_year_post = stub(:creation_date => Date.new(last_year,9,12))
        actual_year_post = stub(:creation_date => Date.new(Date.today.year,9,12))
        posts = [last_year_post,actual_year_post]

        # when
        tagged_posts = PostsDateTagger.to_hash posts

        # then
        tagged_posts.keys[0].should be == Date.today.year.to_s
        tagged_posts.keys[1].should be == last_year.to_s
      end

      it 'posts are ordered by creation_date decreasingly' do
        # given
        actual_year_posts = [
          stub('post 1', :creation_date => Date.new(Date.today.year,1,12)),
          stub('post 2', :creation_date => Date.new(Date.today.year,5,12)),
          stub('post 3', :creation_date => Date.new(Date.today.year,9,12)),
          stub('post 4', :creation_date => Date.new(Date.today.year,12,12))
        ]
        posts = actual_year_posts

        # when
        tagged_posts = PostsDateTagger.to_hash posts

        # then
        tagged_posts[Date.today.year.to_s].should be == posts[0..-1].reverse
      end

      context "about splitting" do
        it "split year in groups of 6 posts" do
          # given
          last_year = Date.today.year-1

          last_year_posts = [
            stub(:creation_date => Date.new(last_year,1,23)),
            stub(:creation_date => Date.new(last_year,3,15)),
            stub(:creation_date => Date.new(last_year,5,15)),
            stub(:creation_date => Date.new(last_year,6,15)),
            stub(:creation_date => Date.new(last_year,8,15)),
            stub(:creation_date => Date.new(last_year,8,15)),
            stub(:creation_date => Date.new(last_year,8,15)),
            stub(:creation_date => Date.new(last_year,9,15)),
            stub(:creation_date => Date.new(last_year,9,15)),
            stub(:creation_date => Date.new(last_year,10,15)),
            stub(:creation_date => Date.new(last_year,10,15)),
            stub(:creation_date => Date.new(last_year,12,15))
          ]

          actual_year_posts = [
            stub(:creation_date => Date.new(Date.today.year,1,23)),
            stub(:creation_date => Date.new(Date.today.year,3,15)),
            stub(:creation_date => Date.new(Date.today.year,5,15)),
            stub(:creation_date => Date.new(Date.today.year,6,15)),
            stub(:creation_date => Date.new(Date.today.year,8,15)),
            stub(:creation_date => Date.new(Date.today.year,8,15)),
            stub(:creation_date => Date.new(Date.today.year,8,15)),
            stub(:creation_date => Date.new(Date.today.year,9,15)),
            stub(:creation_date => Date.new(Date.today.year,9,15)),
            stub(:creation_date => Date.new(Date.today.year,10,15)),
            stub(:creation_date => Date.new(Date.today.year,10,15)),
            stub(:creation_date => Date.new(Date.today.year,12,15))
          ]

          posts = actual_year_posts + last_year_posts

          # when
          tagged_posts = PostsDateTagger.to_hash posts

          # then
          tagged_posts["#{Date.today.year}/2"].should have(6).posts
          tagged_posts["#{Date.today.year}/1"].should have(6).posts
          tagged_posts["#{last_year}/2"].should have(6).posts
          tagged_posts["#{last_year}/1"].should have(6).posts
        end


        it "group more than 12 posts too" do
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
        end

        it 'keep latest groups with more posts' do
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
            stub(:creation_date => Date.new(Date.today.year,8,10))
          ]

          posts = actual_year_posts

          # when
          tagged_posts = PostsDateTagger.to_hash posts

          # then
          tagged_posts["#{Date.today.year}/3"].should have(6).posts
          tagged_posts["#{Date.today.year}/2"].should have(6).posts
          tagged_posts["#{Date.today.year}/1"].should have(3).posts
        end

        it 'each group is ordered decreasingly' do
          # given
          actual_year_posts = [
            stub("post 1", :creation_date => Date.new(Date.today.year,1,10)),
            stub("post 2", :creation_date => Date.new(Date.today.year,1,20)),
            stub("post 3", :creation_date => Date.new(Date.today.year,2,20)),
            stub("post 4", :creation_date => Date.new(Date.today.year,2,25)),
            stub("post 5", :creation_date => Date.new(Date.today.year,3,10)),
            stub("post 6", :creation_date => Date.new(Date.today.year,3,30)),
            stub("post 7", :creation_date => Date.new(Date.today.year,4,10)),
            stub("post 8", :creation_date => Date.new(Date.today.year,4,20)),
            stub("post 9", :creation_date => Date.new(Date.today.year,5,5)),
            stub("post 10", :creation_date => Date.new(Date.today.year,5,12)),
            stub("post 11", :creation_date => Date.new(Date.today.year,6,3)),
            stub("post 12", :creation_date => Date.new(Date.today.year,6,12)),
            stub("post 13", :creation_date => Date.new(Date.today.year,7,12)),
            stub("post 14", :creation_date => Date.new(Date.today.year,7,25)),
            stub("post 15", :creation_date => Date.new(Date.today.year,8,10))
          ]

          posts = actual_year_posts

          # when
          tagged_posts = PostsDateTagger.to_hash posts

          # then
          tagged_posts["#{Date.today.year}/3"].should == posts[-6..-1].reverse
          tagged_posts["#{Date.today.year}/2"].should == posts[-12..-7].reverse
          tagged_posts["#{Date.today.year}/1"].should == posts[0..-13].reverse
        end
      end
    end
    
  end
end
