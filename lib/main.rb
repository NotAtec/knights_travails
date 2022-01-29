# frozen_string_literal: true
require 'pry-byebug'
# Contains value & children
class Knight
  attr_reader :location, :parent
  attr_accessor :children

  def initialize(data, parent = nil)
    @location = data
    @children = []
    @parent = parent
  end
end

class Board
  def initialize(origin, destination)
    @origin = Knight.new(origin)
    @tree = make_tree(destination)
  end

  def make_tree(dest, depa = @origin)
    queue = [depa]
    current = queue.shift
    history = []
    until current.location == dest
      history << current.location
      moves = find_moves(current.location)
      moves.each do |move|
        node = Knight.new(move)
        unless history.include?(node.location)
          queue << node
          current.children << node
        end
      end
      current = queue.shift
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
  move_set = Board.new(origin, destination)
end
