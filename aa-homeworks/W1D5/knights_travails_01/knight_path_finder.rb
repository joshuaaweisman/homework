require_relative "poly_tree_node"
require "byebug"

class KnightPathFinder
    attr_reader :root_node, :start_position, :move_tree
    attr_accessor :considered_positions



    def initialize(start_position)
        @root_node = PolyTreeNode.new(start_position)
        @start_position = start_position
        @considered_positions = [start_position]
        @move_tree = build_move_tree
    end




    def valid_position?(position)
        position.all? { |index| index >= 0 && index <= 7 }
    end



    def potential_moves_from(position)
        potential_moves = []

        idx1 = position[0]
        idx2 = position[1]

        # list all the possible moves (aka "possibilities") from the given position
            moves_right_forward = [ 
                [(idx1 + 1), (idx2 + 2)], 
                [(idx1 + 2), (idx2 + 1)] 
            ]

            moves_right_backward = [
                [(idx1 + 1), (idx2 - 2)],
                [(idx1 + 2), (idx2 - 1)]
            ]

            moves_left_forward = [
                [(idx1 - 1), (idx2 + 2)],
                [(idx1 - 2), (idx2 + 1)]
            ]

            moves_left_backward = [
                [(idx1 - 1), (idx2 - 2)],
                [(idx1 - 2), (idx2 - 1)]
            ]

        # bundle all these possibilities into a single array
        possibilities = 
            moves_right_forward + 
            moves_right_backward + 
            moves_left_forward + 
            moves_left_backward

        # from these possibilites, select only the ones that are valid moves
        valid_moves = possibilities.select do |move| 
            valid_position?(move) && !potential_moves.include?(move)
        end

        # add the valid moves to potential moves, and return potential moves
        valid_moves.each { |move| potential_moves << move }
        potential_moves  
    end



    def new_move_positions(position)
        possibilities = potential_moves_from(position)
        next_moves = []

        possibilities.each do |move| 
            if !@considered_positions.include?(move)
                @considered_positions << move 
                next_moves << move
            end
        end

        next_moves
    end



    def build_move_tree
        # create a blank array, that will be filled with all the nodes of the tree
        full_tree = Array.new

        # implement bfs search to final all the nodes, and add them to full_tree
        queue = [@root_node]
        until queue.empty?
            current_node = queue.shift
            next_moves = self.new_move_positions(current_node.position)

            next_moves.each do |position_of_new_move|
                new_node = PolyTreeNode.new(position_of_new_move)
                new_node.parent = current_node
                queue << new_node
            end

            full_tree << current_node
        end

        # return the full tree, which now contains every possible path through the entire board (starting at the @start_position)
        full_tree
    end



    def find_path(end_position)
        start_node = self.root_node
        end_node = start_node.dfs(end_position)
        trace_full_path(end_node)
    end


    def trace_full_path(target_node)
        arr = [target_node.position]

        while target_node != self.root_node
            target_node = target_node.parent
            arr.unshift(target_node.position)
        end

        arr
    end

end