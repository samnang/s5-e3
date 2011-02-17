require 'bstree/tree'
require 'bstree/tree_node'

module BSTree
  class DuplicatedValueError < StandardError
    def message
      "There is already this value in tree."
    end
  end
end
