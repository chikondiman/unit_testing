require "rspec"

class ChangeMachine
  def change(number)
    coins = []
    penny = 1
    nickel = 5
    dime = 10
    if number < 5
      number.times do
        coins << penny
      end
    elsif number == 5
      coins << nickel
    elsif number == 10
      coins << dime
    elsif number < 10
      coins << 5
      number -= nickel
      number.times do
        coins << penny
      end
    elsif number < 15
      coins << dime
      number -= dime
      number.times do
        coins << penny
      end
    elsif number == 15
      coins << dime
      coins << nickel
    end
    return coins
  end
end

RSpec.describe ChangeMachine do
  describe "#change" do
    it "should return [1] when given 1" do
      machine = ChangeMachine.new
      expect(machine.change(1)).to eq([1])
    end
  end
  describe "#change" do
    it "should return [1,1] when given 2" do
      machine = ChangeMachine.new
      expect(machine.change(2)).to eq([1, 1])
    end
  end
  describe "#change" do
    it "should return [5,1,1] when given 7" do
      machine = ChangeMachine.new
      expect(machine.change(7)).to eq([5, 1, 1])
    end
  end
  describe "#change" do
    it "should return [10,1,1,1] when given 13" do
      machine = ChangeMachine.new
      expect(machine.change(13)).to eq([10, 1, 1, 1])
    end
  end
  describe "#change" do
    it "should return [5] when given 5" do
      machine = ChangeMachine.new
      expect(machine.change(5)).to eq([10, 1, 1, 1])
    end
  end

  describe "#change" do
    it "should return [10] when given 10" do
      machine = ChangeMachine.new
      expect(machine.change(10)).to eq([10])
    end
  end

  describe "#change" do
    it "should return [10,5] when given 15" do
      machine = ChangeMachine.new
      expect(machine.change(15)).to eq([10, 5])
    end
  end
end
