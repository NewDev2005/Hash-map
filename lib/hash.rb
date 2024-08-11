require_relative 'node'

class HashMap
  def initialize
    @capacity = 16
    @load_factor = 0.8
    @arr = Array.new(@capacity)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char {|char| hash_code = prime_number * hash_code + char.ord}

    hash_code %= @capacity
  end

  def set(key, value)
    index = hash(key)
    raise IndexError if index.negative? || index >= @arr.length

    node = @arr[index]
    if @arr[index].nil?
      @arr[index] = Node.new(key, value)
    else
      until node.nil?
        if node.key == key
          node.value = value
        end
        node = node.next
      end
      new_node = Node.new(key, value, node)
      node = new_node
      @arr[index] = node
    end

    if @capacity*@load_factor.round < keys.length
      @capacity += 8
      set(key, value)
    end
  end

  def get(key)
    index = hash(key)
    until @arr[index].nil?
      if @arr[index].key == key
        return @arr[index].value
      end
      @arr[index] = @arr[index].next
    end
    return 'nil'
  end

  def has?(key)
    index = hash(key)
    until @arr[index].nil?
      if @arr[index].key == key
        return true 
      end
      @arr[index] = @arr[index].next
    end
    return false
  end

  def remove(key)
    index = hash(key)
    after_removal = nil
    until @arr[index].nil?
      if @arr[index].key == key
        value = @arr[index].value
        after_removal = @arr[index]
        break
      end
      previous_nodes = @arr[index]
      @arr[index] = @arr[index].next
    end
    previous_nodes = after_removal.next
    @arr[index] = previous_nodes
    return value
  end

  def length
    length = @arr.length
    count = 0
    for i in (0...length)
      node = @arr[i]
      until node.nil?
        count += 1
        node = node.next
      end
    end
    count
  end

  def clear
    @arr.each_with_index do |elem, index|
      @arr[index] = nil
    end
  end

  def keys
    keys = []
    @arr.each_with_index do |elem, index|
      node = @arr[index]
      until node.nil?
        if !node.key.nil?
          keys.push(node.key)
        end
        node = node.next
      end
    end
    keys
  end

  def values
    values = []
    @arr.each_with_index do |elem, index|
      node = @arr[index]
      until node.nil?
        if !node.value.nil?
          values.push(node.value)
        end
        node = node.next
      end
    end
    values
  end

  def entries
    entries = []
    @arr.each_with_index do |elem, index|
      node = @arr[index]
      if @arr[index].nil?
        next
      else
        until node.nil?
          if node.key
            entries[index] = Array.new.push(node.key).push(node.value)
          end
          node = node.next 
        end
      end
    end
     entries.delete(nil)
    entries
  end
end


