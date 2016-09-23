require "spec_helper"

describe IntSet do
  subject(:int_set) { IntSet.new(4) }

  describe "#initialize" do
    it "should set a max" do
      expect(max_int_set.max).to eq(4)
    end

    it "should initialize the store to the max length" do
      expect(max_int_set.store.length).to eq(20)
    end

    xit "should initialize all the store to false" do
      expect(max_int_set.store.all? { |el| el == false}).to eq(true)
    end
  end

  describe "#insert" do
    xit "returns the store" do
      expect(max_int_set.insert(1)).to eq(max_int_set.store)
    end

    xit "sets the proper value to exist in the store" do
      max_int_set.insert(1)
      expect(max_int_set.store[1]).to eq(true)
    end

    xit "raises an error if attempt to add outside of range" do
      expect { max_int_set.insert(5) }.to raise_error("invalid input")
    end
  end

  describe "#remove" do
    # before(:each) do
    #   max_int_set.insert(1)
    # end

    xit "returns the store" do
      expect(max_int_set.remove(1)).to eq(max_int_set.store)
    end

    xit "removes the value from the store" do
      max_int_set.remove(1)
      expect(max_int_set.store.all? { |el| el == false }).to eq(true)
    end

    xit "raises an error if trying to remove element outside of range" do
      expect { max_int_set.remove(-1) }.to raise_error("invalid input")
    end
  end

  describe "#include?" do
    before(:each) do
      max_int_set.insert(1)
    end

    it "returns whether or not the store includes the number" do
      expect(max_int_set.include?(1)).to eq(true)
      expect(max_int_set.include?(0)).to eq(false)
    end

    it "raises an error if trying to remove element outside of range" do
      expect { max_int_set.include?(-1) }.to raise_error("invalid input")
    end

  end
end
