# Question 1
# In the hash of people and their age below, see if there is an age present for "Spot".

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.has_key?("Spot") # First solution
ages.include?("Spot") # Alternate solution
ages.member?("Spot") # Alternate solution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 2
# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum = 0
ages.values.each { |v| sum+=v } # This is my solution to the question

ages.values.inject(:+) # This is the official solution to the question.
ages.values.reduce(:+) # This does the same thing
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 3
# In the age has below, throw out the really old people age 100 and older.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select { |k,v| v < 100 } # This is my solution 

ages.keep_if { |_, age| age < 100 } # This is the official solution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 4
# Starting with the munsters_description string, convert the string in the 4 ways below:

munsters_description = "The Munsters are creepy in a good way."

"The munsters are creepy in a good way." 
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."

munsters_description.capitalize --> "The munsters are creepy in a good way." 
munsters_description.swapcase --> "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.downcase --> "the munsters are creepy in a good way."
munsters_description.upcase --> "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 5
# We have most of the Munster family in our age hash.  Add ages for Marilyn and Spot to the existing hash.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 6
# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.min --> ["Eddie", 10] # This was my solution
ages.values.min --> 10 # This is official solution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 7
# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.include? "Dino" --> false # My solution
advice.include? "dino" --> true # My solution for downcase dino

advice.match("dino") --> #<MatchData "dino"> # Official solution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 8
# In the array below, find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.index { |x| x.start_with?("Be") } # My solution
flintstones.index { |name| name[0, 2] == "Be" } # Official solution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 9
# Using array#map!, shorten each of these names to just 3 characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map { |name| name[0, 3] } # My solution. Matches official solution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Question 10
# Again, shorten each of these names to just 3 characters -- but this time do it all on one line:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# See answer to Question 9.  I guess I got ahead of myself :)
