module Chess
  class Piece
    def initialize (type, start_pos)
      @type = type
      @start_pos = start_pos
      @color = (@type > 0) ? :white : :black
      
      if @type.zero?
        raise ChessException, ChessException::ERR_NO_PIECE_HERE
      end
      if @type.abs > 6
        raise ChessException, ChessException::ERR_NOT_VALID_PIECE
      end
    end
    
    def move_is_valid? (target)
      case @type.abs
        when PAWN
          pawn_move_valid?(target)
        #when KNIGHT
          #...
        else
          raise ChessException, ChessException::ERR_PIECE_NOT_IMPLEMENTED
      end
    end    
    
    private
    def pawn_move_valid? (target)
      if target[1] == @start_pos[1]
        if @color == :black
          if @start_pos[0] == 6 #starting row
              [5,4].include?(target[0])
          else
              @start_pos[0]-1 == target[0]
          end
        elsif @color == :white
          if @start_pos[0] == 1 #starting row
              [2,3].include?(target[0])
          else
              @start_pos[0]+1 == target[0]
          end
        end
      else
        false
      end
    end
  end
end