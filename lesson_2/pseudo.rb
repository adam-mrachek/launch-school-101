# 1. Write a method that returns the sum of two integers
# Casual version

Request two integers from user
Store each integer as a separate variable
Add integer 1 to integer 2
Print result

# Formal version

START

GET integer 1 from user
SET integer 1 as variable1

GET integer 2 from user
SET integer 2 as variable2 

ADD variable1 to variable2

PRINT result

END

# 2. Write a method that takes an array of strings and returns a string that is all those strings concatenated together.
# Casual version

Given a collection of strings

iterate through each string and "add" it to the previous string to create a new string
save the new string as a variable
print the new string

# Formal version

START

SET array_of_strings
SET new_string

PROGRAM AddStrings
  for EACH element in array_of_strings DO 
    add string to new_string
  PRINT new_string

END

# 3. Write a method that takes an array of integers and returns a new array with every other element.
# Casual version

Given an array of integers
Create new array that contains every other element of original array
Print new array

# Formal Version

START

SET integer_array
SET new_array

for EACH element in integer_array DO
  if element has an even index position
    add element to new_array
  end
end

PRINT new_array

END