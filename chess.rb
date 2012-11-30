module Chess

  require_relative 'chess/board.rb'
  require_relative 'chess/piece.rb'
  require_relative 'chess/game.rb'

  PAWN=1
  KNIGHT=2
  BISHOP=3
  ROOK=4
  QUEEN=5
  KING=6
  
  #black is negative
  START = [ 
       [ROOK, KNIGHT, BISHOP, QUEEN, KING, BISHOP, KNIGHT, ROOK],
       [PAWN, PAWN, PAWN, PAWN, PAWN, PAWN, PAWN, PAWN],
       [0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0],
       [-PAWN, -PAWN, -PAWN, -PAWN, -PAWN, -PAWN, -PAWN, -PAWN],
       [-ROOK, -KNIGHT, -BISHOP, -QUEEN, -KING, -BISHOP, -KNIGHT, -ROOK]
  ]
  
  class ChessException < Exception
    ERR_INVALID_INPUT = 'Invalid input!'
    ERR_NO_PIECE_HERE = 'No piece at this location'
    ERR_NOT_VALID_PIECE = 'Not a valid piece'
    ERR_MOVE_OFF_BOARD = "Move is off the board."
    ERR_MOVE_INVALID = "Not a valid move for this piece."
    ERR_PIECE_NOT_IMPLEMENTED = 'This piece isnt defined yet =('
  end
end

#g = Chess::Game.new
#g.play