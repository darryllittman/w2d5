class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
    # @tail
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
  end

  def include?(key)
  end

  def insert(key, val)
    new_link = Link.new(key, val)

    second_to_last = @tail.prev
# debugger
    @tail.prev = new_link
    new_link.next = @tail
    new_link.prev = second_to_last
    second_to_last.next = new_link


  end

  def remove(key)
  end

  def each
    i = @head.next
    until i == nil
      p i.val
      i = i.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

if __FILE__ == $PROGRAM_NAME

  list = LinkedList.new

  { first: 1, second: 2, third: 3 }.each do |key, val|
    list.insert(key, val)
  end

  p list.each

end
