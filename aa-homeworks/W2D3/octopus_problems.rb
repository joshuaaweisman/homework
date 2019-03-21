# sluggish octopus ############################################
def sluggish_octopus(arr)
    max_length = 0
    longest_fish = nil

    arr.each_with_index do |fish1, idx1|
        next if arr.any? {|fish2| fish2.length > fish1.length}
        longest_fish = fish1
    end
    longest_fish
end


# dominant octopus ############################################
def dominant_octopus(arr)
    merge_sort(arr).last
end

def merge_sort(arr)
    return arr if arr.length <= 1
    mid_idx = arr.length / 2
    pivot = arr[mid_idx]

    left = merge_sort(arr[0...mid_idx])
    right = merge_sort(arr[mid_idx..-1])

    merge(left, right)
end

def merge(arr1, arr2)
    final_arr = []

    until arr1.empty? || arr2.empty?
        if arr1[0].length <= arr2[0].length
            final_arr << arr1.shift
        else
            final_arr << arr2.shift
        end
    end

    final_arr + arr1 + arr2
end


# clever octopus ###############################################
def clever_octopus(arr)
    longest_fish = nil
    longest_length = 0

    arr.each do |fish|
        if longest_fish == nil || fish.length > longest_length
            longest_fish = fish
            longest_length = fish.length
        end
    end
    longest_fish
end


# slow dance ###################################################
def slow_dance(target, arr)
    arr.each_with_index do |move, idx|
        return idx if move == target
    end
end


# fast dance ###################################################
def tiles_hash(arr)
    hash = Hash.new
    arr.each_with_index do |direction, i|
        hash[direction] = i
    end
    hash
end

def fast_dance(target, hash)
    hash[target]
end