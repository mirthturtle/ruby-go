module RubyGo
  class ArrayPrinter
    # for use with https://github.com/nachof/sgf2img

    COLORS = { black: 'B', white: 'W', empty: nil }.freeze

    def initialize
    end

    # takes a RubyGo::Game simulated game
    def print_game(game)
      board_to_array(game.board)
    end

    private

    def board_to_array(board)
      two_d_array = Array.new(board.sizeX) { |i| Array.new(board.sizeY) { |i| nil }}

      # put B or W in the array
      board.rows.each_with_index do |row, i|
        row.each_with_index { |stone, j| two_d_array[i][j] = COLORS[stone.color] }
      end

      two_d_array
    end

  end
end
