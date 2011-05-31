require 'spec_helper'

module Infrastructure
  describe PostfileContent do
    describe 'catch_attributes' do
      before :each do
        @path = 'spec/fixtures/postfile_content/with_all_annotations.html'
      end

      let :all_attributes do
        PostfileContent.new(@path).catch_attributes
      end

      describe 'creation date wrapping' do
        specify 'catch Creation Date: dd/mm/yyyy' do 
          all_attributes[:creation_date].should be == Date.new(1993,03,22)
        end
      end

      describe 'keywords wrapping' do
        specify 'catch Keywords: key1 key2 key3' do 
          all_attributes[:keywords].should be == %w{key1 key2 key3}
        end

        context "haven't keywords annotation" do
          specify 'is an empty array' do
            @path = 'spec/fixtures/postfile_content/without_keywords.html'
            all_attributes[:keywords].should be == []
          end
        end
      end
      describe 'tags wrapping' do
        specify 'catch Tags: tag1 tag2 tag3' do 
          all_attributes[:tags].should be == %w{tag1 tag2 tag3}
        end

        context "haven't tags annotation" do
          specify 'is an empty array' do
            @path = 'spec/fixtures/postfile_content/without_tags.html'
            all_attributes[:tags].should be == []
          end
        end
      end


      it 'catch body' do 
        all_attributes[:body].should be == 'Testing Body 1'
      end
    end
  end
end
