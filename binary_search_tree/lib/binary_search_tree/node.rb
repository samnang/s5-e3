class BinarySearchTree
  class Node

    attr_accessor :value, :branches,:parent

    def initialize(value, parent = nil)
      @value  = value
      @parent = parent
      @branches = {}
    end

    def left
      branches[:left]
    end

    def right
      branches[:right]
    end

    def add(value)
      raise DuplicatedValueError if @value == value

      side = find_side(value)
      branch = branches[side]
      if branch
        branch.add(value)
      else
        branches[side] = Node.new(value, self)
      end
    end

    def find(value)
      return self if @value == value

      branch = left_side?(value) ? left : right

      branch.find(value) if branch
    end

    def delete
      case branches.count
      when 0
        delete_when_no_child
      when 1
        delete_when_one_child
      when 2
        delete_when_two_children
      end
    end

    private

    def find_side(value)
      left_side?(value) ? :left : :right
    end

    def left_side?(value)
      value < @value
    end

    def delete_when_no_child
      parent.branches.delete_if {|_, branch| branch == self }
    end

    def delete_when_one_child
      @value = branches.first.last.value
      branches.clear
    end

    def delete_when_two_children
      successor = find_smallest_successor(right)
      @value = successor.value

      successor.parent.branches.delete(:left)
    end

    def find_smallest_successor(node)
      node.left ? find_smallest_successor(node.left) : node
    end
  end
end
