# frozen_string_literal: true

# Contains value & children
class Node
  include Comparable
  attr_accessor :data, :links

  def initialize(data)
    @data = data
    @links = []
  end

  def add_link(link)
    @links << link
  end
end

# Is a graph, containing the initial location of the piece when initialized. Has methods to create links for all possible moves
class Moveset
  attr_accessor :root

  MOVES = [[2, 1], [1, 2], [2, -1], [1, -2], [-2, 1], [-1, 2], [-2, -1], [-1, -2]].freeze

  def initialize(origin)
    @root = Node.new(origin)
  end

  def build_tree(position = @root)
    return position unless position.exists?

    MOVES.each do |move|
      destination = [position[0] + move[0], position[1] + move[1]]
      next unless valid_move?(destination)

      node = find(destination)
      if node.nil?
        node = Node.new(destination)
        position.links << node
        build_tree(node)
      else
        position.links << node
      end
    end
  end

  def valid_move?(destination)
    return false if destination[0].negative? || destination[0] > 7 || destination[1].negative? || destination[1] > 7

    true
  end

  def find(dest)
    queue = [@root]
    until queue.length.zero?
      current = queue.shift
      queue << current.links unless current.links.nil?
      queue.flatten!
      return current if current == dest
    end
    nil
  end
end

def knight_moves(origin, destination); end
