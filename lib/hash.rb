require_relative 'node'

class HashMap
  def initialize
    @arr = Array.new(16)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char {|char| hash_code = prime_number * hash_code + char.ord}

    hash_code %= 16
  end

  def set(key, value)
    index = hash(key)
    if @arr[index].nil?
      @arr[index] = Node.new(key, value)
    else
      previous_nodes = @arr[index]
      until @arr[index].nil?
        if @arr[index].key == key
          @arr[index].value = value
        end
        @arr[index] = @arr[index].next
      end
      new_node = Node.new(key, value, previous_nodes)
      @arr[index] = new_node
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
end


# hash = HashMap.new

# hash.set('Ruby','Rails')
# hash.set('python','Django')
# hash.set('javascript','Node.js')
# hash.set('php','laravael')

# puts hash.has?('python')