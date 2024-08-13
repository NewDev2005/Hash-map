require_relative 'lib/hash'

test = HashMap.new


test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

test.set('kite', 'red')
test.set('dog', 'black')
test.set('grape', 'black')
test.set('lion', 'king')

test.set('java', 'spring-boot')

  


p test.entries
puts test.arr_length