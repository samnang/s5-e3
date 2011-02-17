require 'spec_helper'

describe BSTree::Tree do
  let(:tree) { BSTree::Tree.new }

  describe "#add" do
    it "should be able to add in different styles" do
      tree.add(3)
      tree.add(4)
      tree << 1 << 2

      tree.root.value.should == 3
      tree.root.right.value.should == 4
      tree.root.left.value.should == 1
      tree.root.left.right.value.should == 2
    end

    it "should raise exception when adding duplicated value" do
      lambda { tree << 1 << 1 }.should raise_error BSTree::DuplicatedValueError
    end
  end

  describe "#find" do
    it "should found the value has been added" do
      tree << 2 << 1 << 3

      tree.find(1).value.should == 1
      tree[1].value.should == 1
    end

    it "should not found for empty tree" do
      tree.find(1).should be_nil
    end

    it "should not found for a value that has not been added" do
      tree << 3 << 2 << 1

      tree.find(4).should be_false
    end
  end

  describe "#remove" do
    context "no child" do
      it "should remove the node" do
        tree << 2 << 1 << 3
        tree[1].should_not be_nil

        tree.remove(1)

        tree[1].should be_nil
      end
    end

    context "one child" do
      it "should remove the node and link to deleted parent" do
        tree << 2 << 1 << 3 << 4

        tree.remove(3)

        tree[4].parent.value.should == 2
      end
    end
  end
end
