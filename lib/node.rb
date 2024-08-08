class Node
  attr_accessor :key, :value, :next

  def initialize(key, value, next_node=nil)
    self.key = key
    self.value = value
    self.next = next_node
  end
end
