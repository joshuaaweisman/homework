# exercise 1: stack ##############################################
class Stack
    attr_accessor :stack


    def initialize
        @stack = []
    end


    def push(el)
        stack << el
    end


    def pop
        stack.pop
        stack
    end


    def peek
        stack[0]
    end
end



# exercise 2: queue ##############################################
class Queue
    attr_accessor :queue


    def initialize
        @queue = []
    end


    def enqueue(el)
        queue << el
    end


    def dequeue
        queue.shift
        queue
    end


    def peek
        queue[0]
    end
end



# exercise 3: map ################################################
class Map 
    attr_accessor :map


    def initialize
        @map = []
    end


    def set(key, value)
        if map.none? { |pair| pair[0] == key }
            map << [key, value]
        else
            map.each { |pair| pair[1] = value if pair[0] == key }
        end

        map
    end


    def get(key)
        map.each { |pair| return pair[1] if pair[0] == key }
        nil
    end


    def delete(key)
        map.each { |pair| map.delete(pair) if pair[0] == key }
    end


    def show
        map
    end
end