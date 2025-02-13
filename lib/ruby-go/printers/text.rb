module RubyGo
  class TextPrinter
    COLORS = { black: 'x', white: 'o', empty: '_' }.freeze

    attr_reader :io

    def initialize(io)
      @io = io
    end

    def print_game(game)
      print_board(game.board)
      io.puts  "   " + "_"*(game.board.sizeX * 2)
      io.print "   Prisoners || White: #{game.captures[:black]} |"
      io.puts  " Black: #{game.captures[:white]}"
      io.puts  "   " + "-"*(game.board.sizeX * 2)
    end

    private

    def print_board(board)
      if board.sizeX < 11
        io.puts "   #{(1..board.sizeX).to_a.join(' ')}"
      else
        io.puts "   #{(1..10).to_a.join(' ')}#{(11..board.sizeX).to_a.join('')}"
      end

      board.rows.each_with_index do |row, i|
        i_str = i+1 < 10 ? " #{i+1}" : "#{i+1}"
        io.print "#{i_str} "
        row.each { |stn| print_stone(stn) }
        io.puts
      end
    end

    def print_stone(stone)
      io.print "#{COLORS[stone.color]} "
    end
  end
end
