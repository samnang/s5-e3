require 'binary_search_tree/node'

class BinarySearchTree
  DuplicatedValueError = Class.new(StandardError)

  attr_accessor :root

  def add(value)
    if root_empty?
      @root = Node.new(value)
    else
      @root.add(value)
    end
  end

  def <<(value)
    add(value)

    self
  end

  def find(value)
    return if root_empty?

    @root.find(value)
  end

  alias :[] :find

  def remove(value)
    node = find(value)

    return if node.nil?

    node.remove
  end

  private

  def root_empty?
    @root.nil?
  end
end
