require 'spec_helper'

module Infrastructure
  describe PostfileContent do
    it 'should catch creation date and body from content' do 
      content = PostfileContent.new 'spec/fixtures/001-Testing Post 1.html'
      content.creation_date == Date.new(1993,03,22)
      content.body == 'Testing Body 1'
    end
  end
end
