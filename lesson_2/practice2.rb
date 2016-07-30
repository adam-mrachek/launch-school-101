integers = [1, 5, 3, 7, 13, 6, 9, 8, 11, 10]
new_array = []

integers.each_with_index { |item, index| new_array << item if index.even? }

p new_array
