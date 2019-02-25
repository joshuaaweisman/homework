class PolyTreeNode
    require "byebug"
    attr_accessor :value
    attr_reader :parent, :children
  

    def initialize(value)
      @value = value
      @parent = nil
      @children = []
    end



    def parent=(parent_node)
        # remove the current node from its old parent's children
        if @parent != parent_node && @parent != nil
            @parent.children.reject! { |child| child == self }
        end

        # set the current node's parent to the new parent_node
        @parent = parent_node

        # add the current node to the new parent_node's children
        unless parent_node == nil || parent_node.children.include?(self)
            parent_node.children << self
        end
    end



    def add_child(child_node)
        child_node.parent=(self)
    end



    def remove_child(child_node)
        raise "That node's not a child" if !@children.include?(child_node)
        child_node.parent=(nil)
    end



    def inspect
        { 'value' => @value, 'parent' => @parent.value, 'children' => @children.map {|child| child.value} }
    end



    def dfs(target_value)
        return self if @value == target_value
        return nil if self == nil

        self.children.each do |child|
            search_result = child.dfs(target_value)
            return search_result if search_result != nil
        end
        nil
    end



    def bfs(target_value)
        queue = [self]
        until queue.empty?
            current_node = queue.shift
            return current_node if current_node.value == target_value
            current_node.children.each { |child| queue << child }
        end

        nil
    end
end