module BSTree
  class TreeNode
    attr_accessor :value, :left, :right, :parent

    def initialize(value)
      @value  = value
    end

    def add(value)
      fail DuplicatedValueError if value_exists?(value)

      node = left_or_right_node(value)
      if node.nil?
        node = TreeNode.new(value)

        if left_side?(value)
          @left = node
        else
          @right = node
        end

        node.parent = self
      else
        node.add(value)
      end
    end

    def find(value)
      return self if value_exists?(value)
      
      node = left_or_right_node(value)

      node.find(value) unless node.nil?
    end

    def remove
      case children_count
      when 0
        remove_when_no_child
      when 1
        remove_when_one_child
      when 2
        remove_when_two_children
      end
    end

    private

    def left_or_right_node(value)
      left_side?(value) ? left : right
    end

    def left_side?(value)
      value < @value
    end

    def value_exists?(value)
      value == @value
    end

    def children_count
      [left, right].compact.count
    end

    def remove_when_no_child
      if parent.left == self
        parent.left = nil
      else
        parent.right = nil
      end
    end

    def remove_when_one_child
      node = left || right
      @value = node.value
      @left = nil
      @right = nil
    end

    def remove_when_two_children
      successor = find_smallest_successor
      @value = successor.value

      successor.parent.left = nil
    end

    def find_smallest_successor
      successor = right
      while successor.left
        successor = successor.left
      end

      successor
    end
  end
end
