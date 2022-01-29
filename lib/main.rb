# frozen_string_literal: true

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
  def initialize; end

  def knight_moves(origin, destination)
    dest = make_tree(destination, Knight.new(origin))
    history = build_history(dest, origin)
    show_path(history.reverse)
  end

  private

  def show_path(path)
    puts "The knight went from #{path[0].location} to #{path[-1].location} in #{path.length - 1} moves"
    puts 'This is your path:'
    path.each { |x| p x.location }
  end

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
