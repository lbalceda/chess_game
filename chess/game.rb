module Chess
  class Game
    def play
      @b = Chess::Board.new
      while (1)
        puts "enter move in format A1B1 :"
        a = gets.chomp
        if a.to_s == "exit"
          puts "GG!"
          break
        else
          begin 
            @b.move(a[0..1], a[2..3])
            print_formatted_board
          rescue ChessException => ex
            p ex.to_s
          end
        end
      end
    end
    
    def print_formatted_board
      #TODO some cool formatting here later with the board.. for now just print it out
      p "#{@b.board.inspect}"
    end
  end
end