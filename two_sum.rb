def bad_two_sum?(array, target)
  #O(n^2) complexity
  i = 0
  while i < array.length - 1
    j = i + 1
    while j < array.length
      return true if array[i] + array[j] == target
      j += 1
    end 
    i += 1 
  end 
  false
end 

def okay_two_sum?(array, target)
  #O(n^2logn)
  sorted = array.sort
  sorted.each_with_index do |el, idx|
    sub_arr = sorted[0...idx] + sorted[idx+1..-1]
    return true if sub_arr.bsearch {|x| x + el == target}
  end
  false
end

def best_two_sum?(array, target)
  #O(n)
  hash = Hash.new(0)
  array.each do |el|
    hash[el] += 1 
  end
  array.each do |el|
    complement = target - el 
    return true if hash.has_key?(complement) && complement != el 
    return true if complement == el && hash[el] > 1 
  end
  false
end