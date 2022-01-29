# frozen_string_literal: true
require 'pry-byebug'
require 'benchmark'
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

# Contains all info and methods regarding the management of the board, and the routing on it
class Board
  def initialize(origin, destination)
    @origin = Knight.new(origin)
    make_tree(destination)
  end

  def find; end

  private

  def make_tree(dest, depa = @origin)
    queue = [Knight.new(depa.location)]
    current = queue.shift
    until current.location == dest
      moves = find_moves(current.location)
      moves.each do |move|
        node = Knight.new(move, current)
        queue << node
        current.children << node
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
  move_set.find(destination)
end
