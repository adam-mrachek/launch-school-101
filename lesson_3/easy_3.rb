# Question 1
# Show an easier way to write this array:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles) # My solution & official solution. Can be used for arrays of words
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 2
# How can we add the family pet "Dino" to our usual array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones << "Dino" # My solution & official solution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 3
# In the previous exercise we added Dino to our array like this:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"

# We could have used either Array#concat or Array#push to add Dino to the family. How can we add multiple items to our array? (Dino and Hoppy)

flintstones.concat(%w(Dino Hoppy))
flintstones.push("Dino", "Hoppy")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Question 4
# Shorten this sentence...remove everything starting from "house".

advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!("house training your pet dinosaur.") # My solution
advice.slice!(0, advice.index('house')) # Official solution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 5
# Write a one-liner to count the number of lower-case 't' characters in the following string:

statement = "The Flintstones Rock!"

statement.count "t" # My solution
statement.scan('t').count # Official Solution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 6
# Back in the stone age (before CSS) we used spaces to align things on the screen. 
# If we had a 40 character wide table of Flintstone family members, how could we easily center that title above the table with spaces?

title = "Flintstone Family Members"
title.center(40) # My solution and official solution match
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


