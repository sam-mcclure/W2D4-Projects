def my_min_slow(arr)
  arr.each do |el|
    lowest = arr.all? do |el2|
      el2 >= el 
    end
    return el if lowest
  end
end

def my_min_faster(arr)
  min = arr[0]
  arr.each do |el|
    min = el if el <= min 
  end
  min
end

def largest_contigous_subsum(arr)
  subs = []
  arr.each_index do |idx|
    arr.each_index do |idx2|
      subs << arr[idx..idx2] unless idx > idx2
    end
  end
  
  max = 0
  subs.each do |el| 
    max = el.reduce(:+) if el.reduce(:+) > max
  end
  max
end

def largest_contiguous_subsum_faster(arr)
  max_sum, current_sum = nil, 0 
  arr.each_with_index do |el, idx|
    current_sum += el
    max_sum = current_sum if max_sum.nil? || current_sum > max_sum
    current_sum = 0 if current_sum < 0
  end 
  max_sum
end


  

