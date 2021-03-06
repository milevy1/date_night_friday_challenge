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

    describe '.min' do
      it 'returns the rating & title with the lowest score in the list' do
        expect(@tree.min).to eq({"Johnny English"=>16})
      end
    end

    describe '.sort' do
      it 'Return an array of all the movies and scores in sorted ascending order' do
        expected = [  {"Johnny English"=>16},
                      {"Hannibal Buress: Animal Furnace"=>50},
                      {"Bill & Ted's Excellent Adventure"=>61},
                      {"Sharknado 3"=>92}
                    ]

        expect(@tree.sort).to eq(expected)
      end
    end

    describe '.load' do
      it 'loads a comma separated file of movies and ratings into the tree' do
        new_tree = BinarySearchTree.new

        new_tree.load('movies.txt')

        expect(new_tree.include?(75)).to be(true)
        expect(new_tree.include?(-5)).to be(false)
      end
    end

    describe '.health' do
      xit 'summarizes the number of child nodes (nodes beneath each node) at a given depth' do
        tree = BinarySearchTree.new

        tree.insert(98, "Animals United")
        tree.insert(58, "Armageddon")
        tree.insert(36, "Bill & Ted's Bogus Journey")
        tree.insert(93, "Bill & Ted's Excellent Adventure")
        tree.insert(86, "Charlie's Angels")
        tree.insert(38, "Charlie's Country")
        tree.insert(69, "Collateral Damage")

        expect(tree.health(0)).to eq([[98, 7, 100]])
        expect(tree.health(1)).to eq([[58, 6, 85]])
        expect(tree.health(2)).to eq([[36, 2, 28], [93, 3, 42]])
      end
    end
  end
end
