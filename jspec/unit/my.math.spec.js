describe "MyMath"
  describe "Method div(dividend,divisor)"
    it "should effectuate the integer division"
      MyMath.div(10,5).should.be 2
      MyMath.div(11,5).should.be 2
      MyMath.div(14,5).should.be 2
    end
  end
end
