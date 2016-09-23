require "spec_helper"

describe IntSet do
  subject(:int_set) { IntSet.new(20) }

  describe "#initialize" do
    it "should set a max" do
      expect(int_set.size).to eq(20)
    end

    it "should initialize the store to the max length" do
      expect(int_set.store.length).to eq(20)
    end

    it "should initialize all the store to empty arrays" do
      expect(int_set.store.all? { |el| el == [] }).to eq(true)
    end
  end

  describe "#[]" do
    it "returns the correct array" do
      expect(int_set[0]).to eq([])
    end
  end

  describe "#insert" do
    it "returns the store" do
      expect(int_set.insert(1)).to eq(int_set.store)
    end

    it "sets the proper value to exist in the store" do
      int_set.insert(21)
      expect(int_set.store[1]).to include(21)
    end

    it "is able to store an arbitray number of numbers" do
      (0..39).each { |i| int_set.insert(i) }
      expect(int_set.store.all? { |arr| arr.length == 2 }).to eq(true)
    end

    it "is able to store negative numbers" do
      int_set.insert(-21)
      expect(int_set.store[19]).to include(-21)
    end
  end

  describe "#remove" do
    before(:each) do
     int_set.insert(1)
    end

    it "returns the store" do
      expect(int_set.remove(1)).to eq(int_set.store)
    end

    it "removes the value from the store" do
      int_set.remove(1)
      expect(int_set.store.none? { |arr| arr.include?(1) }).to eq(true)
    end
  end

  describe "#include?" do
    before(:each) do
      int_set.insert(1)
    end

    it "returns whether or not the store includes the number" do
      expect(int_set.include?(1)).to eq(true)
      expect(int_set.include?(0)).to eq(false)
    end
  end
end
