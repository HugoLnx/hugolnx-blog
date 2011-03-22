require 'spec_helper'

describe Array do
  it 'should pass through it elements adding result of the block' do
    resultado = [1,2,3,4,5].sum{|number| number * 2 }
    resultado = 30
  end
end
