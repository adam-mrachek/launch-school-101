# Question 1
# Predict how the values and object ids will change throughout the flow of the code below:

"Essentially, the program shows that object ids of variables change when their values change."
"So, when the value of variable_1 changes from 10 to 20, the object id will change."
"If two variables share the same value, it's possible that those variables will share an object id."
"Object ids don't change between the inside and outside scope of a block."
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 2
# Let's look at object id's again from the perspective of a method call instead of a block.

"Variables, values, and object ids get a little more confusing with methods."
"Variables inside and outside of a method can have the same object id, but the are NOT the same variable (because of variable scope)."
"The original x_outer variables maintained the values and object ids because the method accepts VALUES as paramenters."
"The names given to the values in the definition of the method are separate from any other use of the names."
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
# Question 3
# Let's call a method, and pass both a string and an array as parameters and see how even though they are treated in the same way by Ruby, the results can be different.
# Study the following code and state what will be displayed...and why:

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
"This code will display:"
"My string looks like this now:'pumpkins'."
"My array looks like this now: ['pumpkins', 'rutabaga']" 
"because the += does not alter the string variable while << does alter the array variable."
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 4
# To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param.gsub!('pumpkins', 'rutabaga')
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Solution
"This code will display:"
"My string looks like this now: rutabaga"
"My array looks like this now: ['pumpkins']"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 5
# How could the unnecessary duplication in this method be removed?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# Solution
def color_valid(color)
  color == "blue" || color == "green"
end
