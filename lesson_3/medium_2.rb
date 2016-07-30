# Question 1
# Hashes are commonly found to be more complex than the simple one we saw earlier:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# It is often the case that each key points to another hash instead of a single value:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

# Solution
total_age = 0
munsters.each do |name, info|
 total_age += info["age"] if info["gender"] == "male"
end

puts total_age
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 2
# One of the most frequently used real-world string properties is that of "string substitution", where we take a hard-coded string and 
# modify it with various parameters from our program.
# Given this previously seen family hash, print out the name, age and gender of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# My solution

munsters.each do |name, info|
  puts "#{name} is a #{info["age"]} year old #{info["gender"]}."
end
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 3
# We learned that whether the above "coincidentally" does what we think we wanted "depends" upon what is going on inside the method.
# How can we refactor this exercise to make the result easier to predict and easier for the next programmer to maintain?

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Solution
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 4
# Use String#split in conjunction with Array#join methods to break our string up and then put it back together again in reverse order:

sentence = "Humpty Dumpty sat on a wall."

# My Solution
sentence.split(/\W/).reverse!.join(' ') + '.'

# Official Solution
words = sentence.split(/\W/)
words.reverse!
backwards_sentence = words.join(' ') + '.'
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 5
# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# Solution
"The output is 34 which is the variable 'answer' (42) - 8."
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 6

# Solution
"Yes, the data was ransacked because Spot's program altered the original hash instead of assigning a new variable in the method."
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 7

# Solution
"Paper"

# Explanation from discussion area:

"So the first two calls are: rps("rock", "paper"), rps("rock", "scissors") from left to right. That gives us "paper" and "rock", those are then"
"passed into the second left-most rps call, so we have rps("paper", "rock"), which returns "paper". Then we have the final rps call of"
"rps("paper", "rock") and this gives us "paper" Here is how you could visualize the method calls changing as differentrps` calls return:"

rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
rps(rps("paper", "rock"), "rock")
rps("paper", "rock")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# Question 8
# Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What would be the output of this code:

bar(foo)

# Solution
"The output would be 'no' because 'foo' returns 'yes' which would cause the 'bar' method to return no."