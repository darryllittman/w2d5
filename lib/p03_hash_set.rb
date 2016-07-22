require 'byebug'
require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    hashed_el = key.hash
    if count == num_buckets
      resize!
    end
# debugger
    @store[hashed_el % num_buckets] << key
    @count += 1
    p @store
  end

  def include?(key)
    i = key.hash % num_buckets
    @store[i].include?(key)
  end

  def remove(key)
    i = key.hash % num_buckets
    @store[i].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    num_buckets.times do
      @store << []
    end

    old_bucket = @store.flatten

    old_bucket.each do |el|
      i = el.hash % num_buckets

      @store[i] << el
    end

    # @store.each do |bucket|
    #   bucket.each do |el|
    #     @store[el.hash % num_buckets] = el
    #   end
    # end
  end
end
