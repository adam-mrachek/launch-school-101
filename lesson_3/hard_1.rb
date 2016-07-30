# Question 1
# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = “hello world”
end

greeting

# Solution
"Nothing will print because greeting was initialized inside the 'if' block so the local variable is nil."
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 2
# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# Solution
"The result will be {:a=>'hi there'}.  **See explanation below."

"The output is {:a=>"hi there"}. The reason is because informal_greeting is a reference to the original object." 
"The line informal_greeting << ' there' was using the String#<< method, which modifies the object that called it." 
"This means that the original object was changed, thereby impacting the value in greetings."
"If instead of modifying the original object, we wanted only modify informal_greeting but not greetings, there are a couple of options:"
" - we could initialize informal_greeting with a reference to a new object containing the same value by informal_greeting = greetings[:a].clone."
" - we can use string concatenation, informal_greeting = informal_greeting + ' there', which returns a new String object instead of modifying the original object."
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 3
# In other exercises we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.
# To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.
# What will be printed by each of these code groups?

# Group A
# This program will print:
"one is: one"
"two is: two"
"three is: three"

# Group B
# This program will print:
"one is: one"
"two is: two"
"three is: three"

# Group C
# This program will print
"one is: two"
"two is: three"
"three is: one"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 4
# Write a method that returns one UUID when called with no parameters.

# My Solution
def create_uuid
  characters = [*'a'..'f', *'0'..'9']
  "#{characters.sample(8).join}-#{characters.sample(4).join}-#{characters.sample(4).join}-#{characters.sample(4).join}-#{characters.sample(12).join}"
end

p create_uuid

# My 2nd Solution

def create_uuid
  characters = [*'a'..'f', *'0'..'9']
  uuid = ''
  sections = [8, 4, 4, 4, 12]
    sections.each_with_index do |section, index|
    uuid += characters.sample(section).join
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

p create_uuid

# My 3rd Solution

require 'securerandom'

def create_uuid
  sections = [4, 2, 2, 2, 6]
  uuid = ''
  sections.each_with_index do |section, index|
    uuid += SecureRandom.hex(section)
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

p create_uuid

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 5

# Solution

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end
  
  true
end