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
  end



  def winning_node?(evaluator)
  end




  def children
    # Create an empty array. By the end of this method, this array will contain all the potential boards that could possibly exist ONE MOVE from now. 
    # Each of these "potential boards" will be a full "TicTacToeNode" object -- or, as we're going to call it, a "node."
    potential_game_states = Array.new

    # Okay, let's get started filling up that array.
    # First, let's iterate through all the positions on the current board, one at a time.
    self.board.rows.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|

        # Let's say that the last player that took a turn was using the letter "o."
        # This means that right now, the "next move" in the game will be the letter "x." This is represented by @next_mover_mark, up there in #initialize.
        # But once this "next move" actually happens, the next move AFTER THAT will switch back to the previous letter, the letter "o." 
        # So right now, we're going to create a new variable, called swapped_mark.
        # This variable flips the "next move" letter, so that every time we come to a new move, the "next move" after it will be the OPPOSITE LETTER from whatever it is now.
        swapped_mark = ((next_mover_mark == :x) ? :o : :x)

        # Alright! We're ready to create our new "potential game state." Or, in dummy terms, our "potential board," which shows us what the board COULD look like one move from now.
        # REMEMBER: There's going to be a "potential board" for each EMPTY SPACE on the current board. This is because the only potential moves we can still make...are the ones where the board has empty spaces.
        # So first, let's create an IF STATEMENT -- we're only going to make a new node if the current space on the board is empty (or, in other words, if it equals "nil.")
        if col == nil

          # Great! Next, let's create our brand new "potential board" -- or, in other words, our new TicTacToeNode object (or "node," for short).
          # NOTE: This node uses a "duped" copy of the current board...because we don't want to actually change anything on the REAL board. All we want to do is list a potential option for what the next move could "potentially" look like.
          # SECOND NOTE: This node also contains our "swapped_mark" (above)...because remember, the "next move" after this one is going to be the opposite letter from whatever it is now.
          node = TicTacToeNode.new(self.board.dup, swapped_mark)

          # Okay, so next, we're going to fill that empty space on the board with our "next_mover_mark." 
          # Basically, this means that if the next_mover_mark is "x," our new board is going to have an "x" in the empty spot we currently have selected.
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
