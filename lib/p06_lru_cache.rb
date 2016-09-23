require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count

  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      link = @map[key]
      update_link!(link)
    else
      calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    value = @prc.call(key)

    new_link = @store.insert(key, value)
    @map[key] = new_link

    eject! if @max < count
    value
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
    link.prev.next = link.next
    link.next.prev = link.prev

    link.prev = @store.last
    link.next = @store.last.next

    @store.last.next = link
  end

  def eject!
    lru = @store.first

    lru.next.prev = lru.prev
    lru.prev.next = lru.next

    @map.delete(lru.key)
  end

  def remove_link(link)
    
  end
end
