module BSTree
  class TreeNode
    attr_accessor :value, :left, :right, :parent

    def initialize(value)
      @value  = value
      @children_count = 0
    end

    def add(value)
      fail DuplicatedValueError if value_exists?(value)

      node = left_side?(value) ? @left : @right
      if node.nil?
        node = TreeNode.new(value)
        if left_side?(value)
          @left = node
        else
          @right = node
        end

        @children_count += 1
        node.parent = self
      else
        node.add(value)
      end
    end

    def find(value)
      return self if value_exists?(value)
      
      node = left_side?(value) ? @left : @right

      node.find(value) unless node.nil?
    end

    def remove
      if @children_count == 0
        if parent.left == self
          parent.left = nil
        else
          parent.right = nil
        end
      elsif @children_count == 1
        if @left
          @value = @left.value
          @left = nil
        else
          @value = @right.value
          @right = nil
        end
      end
    end

    private

    def left_side?(value)
      value < @value
    end

    def right_side?(value)
      !left_side?(value)
    end

    def value_exists?(value)
      value == @value
    end
  end
end
