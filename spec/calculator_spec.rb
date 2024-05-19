require './calculator'

RSpec.describe Calculator do
  describe '#add' do
    it 'splits the args and returns the sum' do
      expect(Calculator.new.add("")).to eq(0)
      expect(Calculator.new.add("1")).to eq(1)
      expect(Calculator.new.add("1,15")).to eq(16)
    end

    it "allow new lines between numbers" do 
      expect(Calculator.new.add("1\n2,3")).to eq(6)
    end

    it "throws error when input has negative numbers" do 
      expect { Calculator.new.add("1,-1,2") }.to raise_error(an_instance_of(NegativeArgument).and having_attributes(message: "You cant have negative numbers in input: -1"))

      expect { Calculator.new.add("1,-1,-2") }.to raise_error(an_instance_of(NegativeArgument).and having_attributes(message: "You cant have negative numbers in input: -1,-2"))
    end

    it "should sum even with other delimiters" do
      expect(Calculator.new.add("//;\n1;2")).to eq(3)
    end

    it "should handle invalid input" do 
      expect(Calculator.new.add("1,\n")).to eq(1)
    end

    it "handle dynamic delimiters" do
      expect(Calculator.new.add("//^\n1^2")).to eq(3)
      expect(Calculator.new.add("//$\n1$2")).to eq(3)
    end

    it "handle bigger strings" do
      expect(Calculator.new.add("//$\n1;2;3;;4;5;6;7;8;94;2;4;56;67;8;8;;3;2;4;67;8;545")).to eq(904)
    end

    it "handle if delimiter mismtach happens" do
      expect(Calculator.new.add("//$\n1;2;3;;4")).to eq(10)
    end

    it "should handle decimal numbers as well" do 
      expect(Calculator.new.add("//$\n1;2;3;;4.5")).to eq(10.5)
    end
  end
end
