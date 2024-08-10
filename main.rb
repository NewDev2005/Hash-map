require_relative 'lib/hash'

test = HashMap.new

# test.set('apple', 'red')
#  test.set('banana', 'yellow')
#  test.set('carrot', 'orange')
 
 test.set('elephant', 'gray')
 test.set('frog', 'green')
 test.set('grape', 'purple')
 test.set('hat', 'black')
 test.set('ice cream', 'white')
 test.set('jacket', 'blue')
 test.set('kite', 'pink')
 test.set('lion', 'golden')

#  test.set('ice cream', 'pink')
#  test.set('lion', 'king')
#  test.set('jacket', 'black')
 test.set('java', 'spring boot')
 test.set('dog', 'brown')

 
 puts test.length
 puts test.has?('grape')