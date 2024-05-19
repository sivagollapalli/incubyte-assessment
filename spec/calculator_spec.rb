require './calculator'

RSpec.describe Calculator do
  describe '#add' do
    # it 'splits the args and returns the sum' do
    #   expect(Calculator.new.add("")).to eq(0)
    #   expect(Calculator.new.add("1")).to eq(1)
    #   expect(Calculator.new.add("1,5")).to eq(6)
    # end

    # it "allow new lines between numbers" do 
    #   expect(Calculator.new.add("1\n2,3")).to eq(6)
    # end

    # it "throws error when input has negative numbers" do 
    #   expect { Calculator.new.add("1,-1,2") }.to raise_error(an_instance_of(NegativeArgument).and having_attributes(message: "You cant have negative numbers in input: -1"))

    #   expect { Calculator.new.add("1,-1,-2") }.to raise_error(an_instance_of(NegativeArgument).and having_attributes(message: "You cant have negative numbers in input: -1,-2"))
    # end

    it "should sum even with other delimiters" do
      expect(Calculator.new.add("//;\n1;2")).to eq(3)
    end
  end
end
