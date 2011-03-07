require 'spec_helper'

describe String do
	it 'should be converted to date when have a year of 4 digits' do
		data = '01/02/2010'.to_date
		data.day.should be_eql 1
		data.month.should be_eql 2
		data.year.should be_eql 2010
		data.should be_a Date
	end
	
	it 'should be converted to date when have a year of 2 digits' do
		data = '01/02/10'.to_date
		data.day.should be_eql 1
		data.month.should be_eql 2
		data.year.should be_eql 2010
		data.should be_a Date
	end

  it 'should be returned without first line' do
    "hugo\nroque".without_first_line.should == 'roque'
  end
end
