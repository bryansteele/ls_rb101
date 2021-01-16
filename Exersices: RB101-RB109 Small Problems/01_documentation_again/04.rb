a = [1, 4, 8, 11, 15, 19]
p a.bsearch {|x| x > 8}


# https://docs.ruby-lang.org/en/3.0.0/Array.html#method-i-bsearch



# We use the 'Find-Minimum Mode' binary search.
# In *find-minimum mode*, method `bsearch` **returns the first element for which the block returns true**.