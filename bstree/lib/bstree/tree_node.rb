module BSTree
  class TreeNode
    attr_accessor :value, :left, :right, :parent

    def initialize(value, parent = nil)
      @value  = value
      @parent = parent
    end

    def add(value)
      fail DuplicatedValueError if same_value?(value)

      if left_side?(value)
        @left.nil? ? (@left = TreeNode.new(value, self)) : @left.add(value)
      else
        @right.nil? ? (@right = TreeNode.new(value, self)) : @right.add(value)
      end
    end

    def find(value)
      return self if same_value?(value)
      
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

    def remove_child(child)
      child == @left ? (@left = nil) : (@right = nil)
    end

    private

    def same_value?(value)
      value == @value
    end

    def left_or_right_node(value)
      left_side?(value) ? @left : @right
    end

    def left_side?(value)
      value < @value
    end

    def children_count
      [@left, @right].compact.count
    end

    def remove_when_no_child
      parent.remove_child(self)
    end

    def remove_when_one_child
      node = @left || @right
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
      successor = @right
      while successor.left
        successor = successor.left
      end

      successor
    end
  end
end
