require "byebug"

class Node
    attr_accessor :key, :val, :prev, :fol
    def initialize(key, val, prev = nil, fol = nil)
        @key = key
        @val = val
        @prev = prev
        @fol = fol
    end

    def inspect
        @key
    end
end


def organize(hash, arr)
    hash.keys.each do |key|
        code = key.hash
        target_slot = code % arr.length
        bucket = arr[target_slot]

        if bucket.length < 1
            bucket << Node.new(key, hash[key])
        else
            previous_node = bucket.last
            new_node = Node.new(key, hash[key], previous_node)
            bucket << new_node
            previous_node.fol = new_node
        end
    end
    arr
end



def organize_2(hash, arr)
    debugger
    hash.keys.each do |key|
        code = key.hash
        target_slot = code % arr.length
        bucket = arr[target_slot]

        if bucket.length < 1
            bucket << Node.new(key, hash[key])
        else
            previous_node = bucket.last #### How do I access the LAST NODE in the doubly-ordered list?
            new_node = Node.new(key, hash[key], previous_node)
            previous_node.fol = new_node
        end
    end
    arr
end



# class LinkedList
#     attr_accessor :head

#     def initialize
#         @head = nil
#     end

#     def append(node)

#     end

# end