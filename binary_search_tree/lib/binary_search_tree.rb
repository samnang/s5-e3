require 'binary_search_tree/node'

class BinarySearchTree
  DuplicatedValueError = Class.new(StandardError)

  attr_accessor :root

  def <<(value)
    if @root
      @root.add(value)
    else
      @root = Node.new(value)
    end

    self
  end

  def find(value)
    return unless @root

    @root.find(value)
  end

  alias :[] :find

  def delete(value)
    node = find(value)

    return if node.nil?

    node.delete
  end
end
