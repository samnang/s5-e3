module BSTree
  class Tree
    attr_accessor :root

    def add(value)
      if root_empty?
        @root = TreeNode.new(value)
      else
        @root.add(value)
      end
    end

    def <<(value)
      add(value)

      self
    end

    def find(value)
      return nil if root_empty?

      @root.find(value)
    end

    alias :[] :find

    def remove(value)
      node = find(value)

      return nil if node.nil?

      node.remove
    end

    private

    def root_empty?
      @root.nil?
    end
  end
end
