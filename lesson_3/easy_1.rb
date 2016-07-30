# Question 1
# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# Answer 1: It would print out 1, 2, 2, 3.  The uniq method does not permanently alter the variable.  uniq! would permanently alter it.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 2
# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

1. what is != and where should you use it?
--> != is the "not equal to" operator and you would use it to compare two variables.

2. put ! before something, like !user_name
-->  It would return the opposite of the objects boolean state. user_name would be true, while !user_name would return false.

3. put ! after something, like words.uniq!
--> Putting ! after a method like uniq would cause the method to permanently modify the object it was called on.

4. put ? before something
--> I believe this is referring to using ? in the ternary operator in if-then-else statements.

5. put ? after something
--> Putting ? after something such as a method will return true or false.

6. put !! before something, like !!user_name
--> Putting !! before something returns the boolean equivalent.  !!user_name would return true.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 3
# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!("important", "urgent") # This is the solution.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 4
# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What does the follow method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)  # This method deletes the value at index position '1' which is the number 2 in this array.  The new array would be [1, 3, 4, 5]
numbers.delete(1)     # This method deletes the value '1' regardless of index position in the array.  The new array would be [2, 3, 4, 5]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 5
# Programmatically determine if 42 lies between 10 and 100. hint: Use Ruby's range object in your solution.

(10..100).include?(42) # This is a solution
(10..100).cover?(42) # Alternate solution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 6
# Starting with the string below, show two different ways to put the expected "Four score and " in front of it.

famous_words = "seven years ago..."

famous_words.insert(0, "Four score and ") # First solution
famous_words.prepend("Four score and ") # Second solution
"Four score and " << famous_words # Third solution
"Four score and " + famous_words # Fourth solution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 7
# Fun with gsub:

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
p eval(how_deep)  # --> The result of this method is 42.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 8
# If you build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# We will end up with this "nested" array below.  Make this into an un-nested array.

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

flintstones.flatten! # This will un-nest the arrays and produce the array below:

["Fred", "Wilma", "Barney", "Betty", "BamBam", "Pebbles"]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 9
# Given the hash below, turn this into an array containing only two elements: Barney's name and Barney's number

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

barney = flintstones.select { |k, v| k == 'Barney' }.to_a.flatten # This is my original solution and produces the array below:

["Barney", 2] 

flintstones.assoc("Barney") # This is official/correct solution and produces the same array.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 10
# Given the array below, turn this array into a hash where the names are the keys and the values are the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}

flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

