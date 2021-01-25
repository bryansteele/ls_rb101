hash = { a: 'ant', b: 'bear' }
hash.shift

# => [:a, 'ant'] --- According to the docs for Hash#shift, shift permenantly removes the first key/value pair and returns a 2-element Array containing the removed items.