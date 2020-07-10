require 'pry'

def Caesar(string,num)
  str_array = string.split("")
  cap_letters = ("A".."Z").to_a
  low_letters = ("a".."z").to_a
  caesar = []

  str_array.each do |char|
    unless cap_letters.include?(char) || low_letters.include?(char)
      caesar.push(char)
      next
    end
    # shift positive numbers x amount of times 
    if(num>0)
      #manipulate capital letters 
      if cap_letters.include?(char)
        caesar = shift_forward(cap_letters,caesar,num,char)
      #manipulate lower case letters 
      elsif low_letters.include?(char)
        caesar = shift_forward(low_letters,caesar,num,char)
      end
    # shift negative numbers x amount of times
    else
      if cap_letters.include?(char)
        caesar = shift_backwards(cap_letters,caesar,num,char)
      elsif low_letters.include?(char)
        caesar = shift_backwards(low_letters,caesar,num,char)
      end
    end
  end
  p caesar.join("")
end
# allows the shift to wrap around A-Z or a -Z no matter how high the number is.
def shift_forward (arr,caesar,num,char)
  pos = arr.find_index(char)
  # shift num amount of spaces. When you reach Z, toggle back to A and continue- 
  # shifting x amount of spaces left. when you reach the last letter insert into the
  # caesar array
  0.upto(num) do |i|
    if pos > 25
      pos = 0
    end
    if i == num
      caesar.push(arr[pos])
    end
    pos +=1
  end
  return caesar
end

def shift_backwards (arr,caesar,num,char) 
  pos = arr.find_index(char)
   
  num.upto(0) do |i|
    if pos < 0
      pos = 25
    end
    if i == 0
      caesar.push(arr[pos])
    end
    pos -= 1
  end
  return caesar
end
 
    

Caesar("D!",-3)
