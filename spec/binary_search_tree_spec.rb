require './lib/binary_search_tree'

RSpec.describe 'Binary Search Tree' do
  before :each do
    @tree = BinarySearchTree.new
  end

  it 'can be initialized' do
    expect(@tree).to be_an_instance_of(BinarySearchTree)
  end

  describe 'class methods' do
    before :each do
      @tree.insert(61, "Bill & Ted's Excellent Adventure")
      @tree.insert(16, "Johnny English")
      @tree.insert(92, "Sharknado 3")
      @tree.insert(50, "Hannibal Buress: Animal Furnace")
    end

    describe '.insert' do
      it 'adds a new node with the passed-in data' do
        expect(@tree.include?(61)).to eq(true)
      end

      it 'can insert multiple nodes' do
        expect(@tree.include?(61)).to eq(true)
        expect(@tree.include?(16)).to eq(true)
      end
    end

    describe '.include?' do
      it 'Verify/reject the presence of a score in the tree' do
        expect(@tree.include?(16)).to eq(true)
        expect(@tree.include?(72)).to eq(false)
      end
    end

    describe '.depth_of' do
      it 'Reports the depth of the tree where a score appears' do
        expect(@tree.depth_of(92)).to eq(1)
        expect(@tree.depth_of(50)).to eq(2)
      end

      it 'Return nil if the score does not exist' do
        expect(@tree.depth_of(1)).to be_nil
      end
    end

    describe '.max' do
      it 'returns the rating & title with the highest score in the list' do
        expect(@tree.max).to eq({"Sharknado 3"=>92})
      end
    end
  end
end
