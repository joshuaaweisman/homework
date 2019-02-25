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