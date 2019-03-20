require_relative 'tic_tac_toe'
require "byebug"

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos, :parent



  def initialize(board, next_mover_mark, prev_move_pos = nil, parent = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @parent = parent
  end



  def losing_node?(evaluator)
    opponent = ((evaluator == :x) ? :o : :x)
    if self.board.over? && self.board.winner == opponent
      return true 
    end

    
  end



  def winning_node?(evaluator)
  end




  def children
    potential_game_states = Array.new

    self.board.rows.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        swapped_mark = ((next_mover_mark == :x) ? :o : :x)

        if col == nil
          node = TicTacToeNode.new(self.board.dup, swapped_mark)        
          node.board.rows[row_idx][col_idx] = next_mover_mark
          node.parent = self
          node.prev_move_pos = [row_idx, col_idx]

          potential_game_states << node
        end
      end
    end

    potential_game_states
  end



end
