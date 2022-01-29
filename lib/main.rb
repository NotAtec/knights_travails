# frozen_string_literal: true
require 'pry-byebug'
# Contains value & children
class Knight
  attr_accessor :data, :links

  def initialize(data, parent = nil)
    @location = data
    @children = []
    @parent = parent
  end
end

class Board

  def self.make_tree(depa, dest)
    queue = depa
    current = queue.shift
    until current.location == dest
      moves = find_moves(current.location)
      moves.each do |move|
        # DO STUFF FOR EACH VALID MOVE
      end
    end
  end

  def find_moves(location, res = [])
    moves = [[2, 1], [1, 2], [2, -1], [1, -2], [-2, 1], [-1, 2], [-2, -1], [-1, -2]].freeze
    moves.each do |move|
      destination = [location[0] + move[0], location[1] + move[1]]
      res << destination if destination[0].between?(0, 7) && destination[1].between?(0, 7)
    end
    res
  end
end

def knight_moves(origin, destination)
  origin = Knight.new(origin)
  tree = Board.make_tree(origin, destination)
end
