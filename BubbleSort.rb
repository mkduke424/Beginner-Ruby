require 'pry'
#input - take in an array of numbers
def bubble_sort(arr)
  unsorted = true
  sorted = []

  while unsorted
# when you have locked every index and only have one value your bubble sort should be complete 
    if arr.length == 0
      unsorted = false
    end
     0.upto(arr.length-1) do |i|
# lock that last index( push it to a new array?) and start the algorithim again at the first index
     if i == arr.length-1 
      sorted.unshift(arr.last)
      arr.delete_at(i)

     elsif arr[i] < arr[i+1]
      next
# starting at the first index for each pair of numbers find the the greater of the two and make them swap places
      elsif arr[i] > arr[i+1]
        first = arr[i+1]
        second = arr[i]
        arr[i] = first
        arr[i + 1] = second
      end
    end
  end
# output - the sorted locked array of number
  return sorted
end

p bubble_sort([4,3,78,2,0,2])
