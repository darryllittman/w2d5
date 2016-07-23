require_relative 'p02_hashing'
require_relative 'p04_linked_list'
require 'byebug'

class HashMap
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    if bucket(key).include?(key)
      bucket(key).remove(key)
    else
      @count += 1
    end

    bucket(key).insert(key, val)
  end

  def get(key)
    target_link = bucket(key).select { |link| link.key == key }
    target_link.empty? ? nil : target_link.first.val
  end

  def delete(key)
    @count -= 1
    bucket(key).remove(key)
  end

  def each(&prc)
    i = bucket.head.next
    until i == self.tail
      prc.call(i.key, i.val)
      i = i.next
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    i = key.hash % num_buckets
    @store[i]
    # optional but useful; return the bucket corresponding to `key`
  end
end
