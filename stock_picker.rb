require 'pry'

# input an array of stock prices. (Their index represents their day) 
def stock_picker(array)

#store 2 numbered arrays that consist of every combination of numbers in the passed array
  manipulate_array = array.combination(2).to_a

# change each array's 2 index to contain the difference of the two numbers
  manipulate_array.each do |i|
    i.push(i.max - i.min) 
  end
 
# sort the array by thier difference from largest to smalles 
 sorted_array = manipulate_array.sort {|a,b| b[2] <=> a[2]}
 
 sorted_array.each do |i|
# delete the sum from each combonation 
  i.delete_at(2)
# return the position of the smallest price that comes before the postion of the highest price (returning day to buy low then return the day to buy high)
  if array.index(i.min) < array.index(i.max)
    return [array.index(i.min),array.index(i.max)]
    break
  elsif i == sorted_array.last
    return "There are no buy opportunities in this set of stock prices"
  end
 end
end

p stock_picker([5,2,34,4]) # => [1,4]
