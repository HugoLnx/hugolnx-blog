require 'spec_helper'

describe String do
  describe '.to_date()' do
    context 'convert to date' do
      it 'when have a year of 4 digits (Ex.: "01/02/2010")' do
        data = '01/02/2010'.to_date
        data.day.should be_eql 1
        data.month.should be_eql 2
        data.year.should be_eql 2010
        data.should be_a Date
      end
      
      it 'when have a year of 2 digits (Ex.: "01/02/10")' do
        data = '01/02/10'.to_date
        data.day.should be_eql 1
        data.month.should be_eql 2
        data.year.should be_eql 2010
        data.should be_a Date
      end
    end
  end

  describe '.without_first_line()' do
    it 'return itself without first line' do
      "hugo\nroque".without_first_line.should == 'roque'
    end
  end

  describe '.lines_amount_to_fit_in(columns,:columns)' do
    it 'return the number of lines that will result when fit text in a box of 80 columns' do
      text = "A" * 81
      quantity = text.lines_amount_to_fit_in 80,:columns
      quantity.should be_eql 2
    end
  end
end
