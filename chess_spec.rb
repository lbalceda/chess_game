require_relative 'chess'

describe Chess do
  let(:board) { Chess::Board.new }
  
  context "Board" do
    
    it "initializes board correctly" do
      board.board[0][1].should eq 2
      #check white pawn rows
      (0..7).each do |i|
        board.board[1][i].should eq 1
      end
      #check black pawn rows
      (0..7).each do |i|
        board.board[6][i].should eq -1
      end
      #check whole board
      board.board.should eq Chess::START
    end

    it "translates moves correctly" do
      board.translate_pos("A1").should eq [0,0]
      board.translate_pos("d7").should eq [6,3]
      #outside the board
      expect { board.translate_pos('j9') }.to raise_error Chess::ChessException, Chess::ChessException::ERR_MOVE_OFF_BOARD
    end
  end
  
  context "Piece" do
    
    def translate_pos pos
      board.translate_pos pos 
    end
    
    let(:start_row_pawn) { Chess::Piece.new(Chess::PAWN, translate_pos("A2")) }
    let(:not_start_row_pawn) { Chess::Piece.new(Chess::PAWN, translate_pos("B4")) }
    let(:black_start_row_pawn) { Chess::Piece.new(-Chess::PAWN, translate_pos("C7")) }
    let(:black_not_start_row_pawn) { Chess::Piece.new(-Chess::PAWN, translate_pos("D5")) }

    
    it "checks for invalid pieces" do
      expect { Chess::Piece.new 0, [0,0] }.to raise_error Chess::ChessException, Chess::ChessException::ERR_NO_PIECE_HERE
      expect { Chess::Piece.new 10, [0,0] }.to raise_error Chess::ChessException, Chess::ChessException::ERR_NOT_VALID_PIECE
    end
    
    it "checks pawn moves correctly" do
      start_row_pawn.move_is_valid?(translate_pos("A3")).should eq true
      start_row_pawn.move_is_valid?(translate_pos("A4")).should eq true
      start_row_pawn.move_is_valid?(translate_pos("A5")).should eq false
      not_start_row_pawn.move_is_valid?(translate_pos("B5")).should eq true
      not_start_row_pawn.move_is_valid?(translate_pos("B6")).should eq false
      
      black_start_row_pawn.move_is_valid?(translate_pos("C5")).should eq true
      black_start_row_pawn.move_is_valid?(translate_pos("C6")).should eq true
      black_start_row_pawn.move_is_valid?(translate_pos("C4")).should eq false
      black_not_start_row_pawn.move_is_valid?(translate_pos("D4")).should eq true
      black_not_start_row_pawn.move_is_valid?(translate_pos("D3")).should eq false
    end 
  end
end