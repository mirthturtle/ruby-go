module RubyGo
  class Board
    attr_reader :rows, :sizeX, :sizeY

    def initialize(sizeX, sizeY)
      @rows = Array.new(sizeY) { Array.new(sizeX) { Liberty.new } }
      @sizeX = sizeX
      @sizeY = sizeY
    end

    def empty?
      rows.flatten.all?(&:empty?)
    end

    def at(x, y)
      rows[y][x]
    end

    def around(x, y)
      intersections = []

      intersections << at(x-1, y) unless x == 0
      intersections << at(x+1, y) unless x == (sizeX - 1)
      intersections << at(x, y-1) unless y == 0
      intersections << at(x, y+1) unless y == (sizeY - 1)
      intersections
    end

    def remove(stone)
      return if stone.empty?

      x, y = stone.to_coord

      rows[y][x] = Liberty.new
    end

    def place(stone)
      x, y = stone.to_coord

      rows[y][x] = stone
    end

    def liberties(stone)
      libs = []

      group_of(stone).each do |stn|
        libs += around(*stn.to_coord).select(&:empty?)
      end

      libs.uniq.length
    end

    def group_of(stone, stones = [])
      return stones if stones.include?(stone)

      stones << stone

      around(*stone.to_coord).each do |intersection|
        next if intersection.empty?

        group_of(intersection, stones) if intersection.color == stone.color
      end

      stones
    end
  end
end
