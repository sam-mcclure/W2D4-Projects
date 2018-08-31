def first_anagram?(str1, str2)
  perms = str1.chars.permutation.to_a
  strings = perms.map { |el| el.join }
  strings.include?(str2)
end

def second_anagram?(str1, str2)
  arr1 = str1.chars
  arr2 = str2.chars
  arr1.each do |ltr|
    found_index = arr2.find_index(ltr)
    arr2.delete_at(found_index) unless found_index.nil?
  end
  
  arr2.length == 0
end

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end 

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.each_char do |ltr|
    hash1[ltr] += 1
  end
  
  str2.each_char do |ltr|
    hash2[ltr] += 1
  end 
  
  hash1 == hash2
end

def fifth_anagram?(str1, str2)
  hash1 = Hash.new(0)

  str1.each_char do |ltr|
    hash1[ltr] += 1
  end
  
  str2.each_char do |ltr|
    hash1[ltr] += 1 if hash1.has_key?(ltr)
  end 
  
  hash1.values.all? {|val| val.even?}
end