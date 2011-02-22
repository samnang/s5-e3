require 'spec_helper'

describe BinarySearchTree do
  let(:tree) { BinarySearchTree.new }

  describe "#add" do
    it "should be able to add in different styles" do
      tree.add(3)
      tree.add(4)
      tree << 1 << 2

      tree.root.should have_value 3
      tree.root.right.should have_value 4
      tree.root.left.should have_value 1
      tree.root.left.right.should have_value 2
    end

    it "should raise exception when adding duplicated value" do
      lambda { tree << 1 << 1 }.should raise_error BinarySearchTree::DuplicatedValueError
    end
  end

  describe "#find" do
    it "should found the value has been added" do
      tree << 2 << 1 << 3

      tree.find(1).should have_value 1
      tree[1].should have_value 1
    end

    it "should not found for empty tree" do
      tree.find(1).should be_nil
    end

    it "should not found for a value that has not been added" do
      tree << 3 << 2 << 1

      tree.find(4).should be_nil
    end
  end

  describe "#remove" do
    context "no child" do
      it "should remove the node" do
        tree << 2 << 1 << 3

        tree.remove(1)

        tree[1].should be_nil
        tree.root.left.should be_nil
      end
    end

    context "one child" do
      it "should update node\'s value to its child\'s value and remove child node" do
        tree << 2 << 1 << 3 << 4

        tree.remove(3)

        tree[4].parent.should have_value tree.root.value
        tree.root.right.should have_value 4
      end
    end

    context "two children" do
      it "should replace its value with its successor\'s value and fix the successor\'s parent\'s child" do
        tree << 8 << 3 << 1 << 6 << 4 << 7 << 10

        tree.remove(3)

        tree.root.left.should have_value 4
        tree[4].parent.should have_value tree.root.value
        tree[4].right.should have_value 6
      end
    end
  end
end
