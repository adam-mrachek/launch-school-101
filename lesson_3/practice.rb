def joinor(arr, delimiter=', ', word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  if arr.size == 2
    arr.join(' ')
  else 
    arr.join(delimiter)
  end
end

p joinor([1, 2, 3, 4], ', ', 'or')