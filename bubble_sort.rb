# script to bubble sort a given array

def bubble_sort (array)
 (array.size-1).times do
    i = 0
    while i <= (array.size-1) do
      if (array[i] <=> array[i+1]) == 1
        array[i], array[i+1] = array[i+1], array[i]
      end
    i += 1 
    end
  end
  p array
end


bubble_sort([10,2,6,2,1,5,8,6,0,2,8,9, 453 ,345 ,345,345 ])
