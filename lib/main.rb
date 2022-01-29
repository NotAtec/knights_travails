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

  def build_tree
  end
end

def knight_moves(origin, destination)
end