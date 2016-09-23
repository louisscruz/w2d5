class IntSet
  attr_reader :size, :store

  def initialize(size)
    @size = size
    @store = Array.new(@size) { [] }
  end

  def insert(num)
    self[num] << num
    @store
  end

  def [](num)
    @store[num % @size]
  end

  def remove(num)
    self[num].delete(num)
    @store
  end

  def include?(num)
    self[num].include?(num)
  end
end
