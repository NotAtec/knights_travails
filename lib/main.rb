# frozen_string_literal: true
require 'pry-byebug'
# Contains value & children
class Knight
  attr_accessor :data, :links

  def initialize(data)
    @location = data
    @moves = find_moves(data)
    @children = []
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

# Is a graph, containing the initial location of the piece when initialized. Has methods to create links for all possible moves
class Moveset
  attr_accessor :root
  
  def initialize(origin)
    @root = Node.new(origin)
  end
end

def knight_moves(origin, destination); end
