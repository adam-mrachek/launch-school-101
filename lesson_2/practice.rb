strings = ["I", "am", "the", "coolest", "dude", "ever"]

new_string = ""

strings.each { |string| new_string << string + " " }

p new_string