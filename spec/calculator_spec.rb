require './calculator'

RSpec.describe Calculator do
  describe '#add' do
    it 'splits the args and returns the sum' do
      expect(Calculator.new.add("")).to eq(0)
      expect(Calculator.new.add("1")).to eq(1)
      expect(Calculator.new.add("1,5")).to eq(6)
    end

    it "allow new lines between numbers" do 
      expect(Calculator.new.add("1\n2,3")).to eq(6)
    end
  end
end
