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
  def initialize(origin, destination); end

  def knight_moves(origin, destination)
    dest = make_tree(destination, Knight.new(origin))
    history = build_history(dest, origin)
    
  end

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
    current
  end

  def find_moves(location, res = [])
    moves = [[2, 1], [1, 2], [2, -1], [1, -2], [-2, 1], [-1, 2], [-2, -1], [-1, -2]].freeze
    moves.each do |move|
      destination = [location[0] + move[0], location[1] + move[1]]
      res << destination if destination[0].between?(0, 7) && destination[1].between?(0, 7)
    end
    res
  end

  def build_history(current, depa, history = [])
    until current.location == depa
      history << current
      current = current.parent
    end
    history << current
    history
  end
end

