# Contains value & children
class Node
  include Comparable
  attr_accessor :data, :links

  def initialize(d)
    @data = d
    @links = []
  end

  def add_link(link)
    @links << link
  end
end

# Is a graph, containing the initial location of the piece when initialized. Has methods to create links for all possible moves
class Moveset
  attr_accessor :root

  def initialize(d)
    @root = Node.new(d)
  end
end
