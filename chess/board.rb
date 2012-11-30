module Chess
  class Board 
     attr_accessor :board
     
     def initialize
       @board = START
     end
     
     #translate D5=3,4,A8=0,7, etc
     def translate_pos (pos)
        pos.downcase!
        if pos[0].between?('a','h') && pos[1].between?('1','8')
         [ pos[1].to_i - 1 , pos[0].ord - 'a'.ord ]
        else
         raise ChessException, ChessException::ERR_MOVE_OFF_BOARD
       end
      end
     
     def move (start_pos, end_pos)
       if start_pos.empty? || end_pos.empty?
        raise ChessException, ChessException::ERR_INVALID_INPUT
       end
       
       start_pos = translate_pos(start_pos)
       end_pos = translate_pos(end_pos)
       type = @board[start_pos[0]][start_pos[1]]
       target_type = @board[end_pos[0]][end_pos[1]]
       
       piece = Piece.new(type, start_pos)
       if !are_same_color?(type, target_type) && piece.move_is_valid?(end_pos)
         move_piece(start_pos, end_pos, type)
       else
         raise ChessException, ChessException::ERR_MOVE_INVALID
       end
     end
     
     private
     #they are same color if 0 is not between them
     def are_same_color? (type, target_type)
        (type < 0 && target_type < 0) || (type > 0 && target_type > 0)
     end
     
     #move piece and mark old spot as empty 
     def move_piece (start_pos, end_pos, value)
       @board[end_pos[0]][end_pos[1]] = value
       @board[start_pos[0]][start_pos[1]] = 0
     end
  end
end