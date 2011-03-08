require 'spec_helper'

module Infraestrutura
  describe Postfile do
    it 'should find all post titles in spec/fixtures' do
      titles = Postfile.find_all_post_titles_in 'spec/fixtures'
      titles.should == ['Testing Post 1','Testing Post 2']
    end

    it 'should find the max id in spec/fixtures' do
      max_id = Postfile.find_id_max_in 'spec/fixtures'
      max_id.should == 2
    end

    it 'should find postfile of id 1 in spec/fixtures' do
      postfile = Postfile.find(1,'spec/fixtures')
      postfile.should be_a Postfile
      postfile.title.should == 'Testing Post 1'
      postfile.creation_date == Date.new(1993,03,22)
      postfile.body == 'Testing Body 1'
    end
  end
end
