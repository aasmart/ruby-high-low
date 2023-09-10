# frozen_string_literal: true

# Calculates the standard deviation of the elements in a list
# +arr+:: a nonempty list to calculate the standard deviation of
def std_dev(arr)
  average = mean(arr)

  sqr_sum = 0
  arr.each do |val|
    sqr_sum += (val - average)**2
  end

  Math.sqrt(sqr_sum / arr.size.to_f)
end

# Calculates the sum of a list's elements
# +arr+:: a list to find the total of
def total(arr)
  arr.reduce do |sum, n|
    sum + n
  end
end

# Calculates the mean of a list's elements
# Params
# +arr+:: a nonempty list to find the mean of
def mean(arr)
  total(arr).to_i / arr.size.to_f
end

# Calculates the median of a list
# - If the list contains an odd number of elements, the middle value will be returned
# - If the list contains and even number of elements, the average of the middle two values will be returned
# +arr+:: a nonempty list to find the median of
def median(arr)
  middle = (arr.size - 1) / 2
  if arr.size % 2 == 0
    (arr[middle] + arr[middle + 1]) / 2.0
  else
    arr[middle]
  end
end