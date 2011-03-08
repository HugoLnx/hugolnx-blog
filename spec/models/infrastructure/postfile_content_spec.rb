require 'spec_helper'

module Infrastructure
  describe PostfileContent do
    it 'should catch creation date and body from content' do 
      postfile = Postfile.find 1, 'spec/fixtures/'
      content = PostfileContent.new postfile.path
      content.creation_date == Date.new(1993,03,22)
      content.body == 'Testing Body 1'
    end
  end
end
