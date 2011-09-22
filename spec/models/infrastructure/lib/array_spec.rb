require 'spec_helper'

describe Array do
  describe '.sum(&block)' do
    it 'iterate the elements adding result of the block' do
      result = [1,2,3,4,5].sum{|number| number * 2 }
      result = 30
    end
  end
end
