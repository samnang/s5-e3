$:.unshift File.expand_path('../../lib', __FILE__)

require 'binary_search_tree'
require 'pp'

class Student
  include Comparable

  attr_accessor :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def <=>(other)
    @id <=> (other.respond_to?(:id) ? other.id : other)
  end
end

student_tree = BinarySearchTree.new

# Add value into tree
(1..1000).to_a.shuffle.each do |id|
  student_tree << Student.new(id, "Student name#{id}")
end

# Chainable adding style 
student_tree << Student.new(1010, "Student name1010") << Student.new(1005, "Student name1005")

# Get student in the tree
pp student_tree[90].value
pp student_tree.find(90).value

# Remove student in the tree
student_tree.delete(1005)
student_tree[90].delete
