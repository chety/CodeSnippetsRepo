# Complexity -> O(n**2). But if data is sorted it's complexity is O(n)
def bubble_sort(arr)
    n = arr.length    
    while n >= 1        
        last_index = 0
        (1..n-1).each do |i|
            if arr[i - 1] > arr[i]                
                arr[i - 1], arr[i] = arr[i] , arr[i - 1]                
                last_index = i
            end
        end        
        n = last_index #to prevent comparing last element
    end
    return arr    
end



def is_sorted(arr)
    (0...arr.length - 1).none? { |i| arr[i] > arr[i + 1] }
end

p is_sorted([34,354,5555,6666,6668])
p is_sorted([34,354,5555,6666,6668,2])