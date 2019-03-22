class LRUCache
    def initialize(num)
        @list = Array.new
        @max_length = num
    end


    def count
        @list.count
    end


    def add(el)
        if @list.length < @max_length
            @list.push(el) 
        elsif @list.include?(el)
            @list.delete(el)
            @list.push(el)
        else 
            @list.delete(@list.first)
            @list.push(el)
        end
    end


    def show
        @list
    end  
end