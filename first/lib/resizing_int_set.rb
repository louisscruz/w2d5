class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)

    self[num] << num
    @count += 1

    resize! if num_buckets < @count

    true
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store

    @count = 0
    @store = Array.new(num_buckets * 2) { Array.new }

    old_store.flatten.each { |i| insert(i) }
  end

  def [](num)
    @store[num % num_buckets]
  end
end
