# Question 1
# For this exercise, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!

10.times { |num| puts (" " * num) + "The Flintstones Rock!" } # My solution. Matches official solution.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 2
# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

frequency = {}

letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_count = statement.scan(letter).count
  frequency[letter] = letter_count if letter_count > 0
end
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 3
# The result of the following statement will be an error. Why is this and what are two possible fixes?

puts "the value of 40 + 2 is " + (40 + 2) # This throws an error because you are trying to add integers to a string.

puts "the value of 40 + 2 is #{40 + 2}." # One solution is to use string interpolation like this example.
puts "the value of 40 + 2 is " + (40 + 2).to_s # Another solution is to convert the sum of (40 + 2) to a string like this example.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 4
# What happens when we modify an array while we are iterating over it? What would be output by this code?

# This program will print 1 and 3. After printing 1, the numbers shift down by one so 2 will be in the first (index 0) position and 3 will be in the 2nd position which will be printed.
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# This will print only 1 and 2 since 3 and 4 are "popped" during the first two iterations so they will not be printed.
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 5

# Solution
while dividend > 0 do
  divisors << number / dividend if number % dividend == 0
  dividend -= 1
end

#Bonus Answer
"The purpose of number % dividend == 0 is to check whether or not the result is an integer."

# Bonus 2 Answer
"The purpose of the second-to-last line (divisors) is to explicitly return the result of divisors. Without it, nothing (nil) would be returned."
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 6

# Solution
"The difference is that the array/buffer that is passed into rolling_buffer2 will not be altered, but it will be altered in rolling_buffer1."
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 7
# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator, A user passes in two numbers, and the calculator will 
# keep computing the sequence until some limit is reached.
# Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?

# Solution
"The problem with Ben's code is that the fib method does not have access to the 'limit'' variable since it was created outside the scope of the method."
"To fix the problem, you can pass in the limit as an argument in the method like below."

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 8

#My solution
def titleize(string)
    title = string.split.each do |word|
        word.capitalize!
    end
    title.join(' ')
end

#Official solution
words.split.map { |word| word.capitalize }.join(' ')

# Question 9 

#My solution

munsters.each do |name, info|
  case info["age"]
  when 0..18
    info["age_group"] = "kid"
  when 18..65
    info["age_group"] = "adult"
  else
    info["age_group"] = "senior"
  end
end
