class MaxIntSet
  attr_reader :max, :store

  def initialize(max)
    @max = max
    @store = Array.new(@max) { false }
  end

  def insert(num)
    raise "invalid input" if include?(num) || !in_range?(num)
    @store[num] = true
    @store
  end

  def remove(num)
    raise "invalid input" unless in_range?(num)
    @store[num] = false
    @store
  end

  def include?(num)
    raise "invalid input" unless in_range?(num)
    @store[num]
  end

  private

  def in_range?(num)
    num.between?(0, @max)
  end

end
