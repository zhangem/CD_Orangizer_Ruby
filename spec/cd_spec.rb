require 'rspec'
require 'cd'

describe CD do
  before do
    CD.clear
  end
  it 'initializes the CD class' do
    test_cd = CD.new({:album => "The Black Album"})
    test_cd.should be_an_instance_of CD
  end
  it 'has the variables album, band, and year' do
    test_cd = CD.new({:band => "The Beatles", :album => "The White Album", :year => "1968"})
    test_cd.band.should eq "The Beatles"
    test_cd.album.should eq "The White Album"
    test_cd.year.should eq "1968"
  end
  describe '.create' do
    it 'creates and initializes a new cd class' do
      test_cd = CD.create({:album => "The Blue Album"})
      test_cd.should be_an_instance_of CD
    end
    it 'saves the new CD to the CD list' do
      test_cd = CD.create(:album => "The Blue Album")
      CD.all.should eq [test_cd]
    end
  end
  describe '.search' do
    it 'searches by the parameter passed into it' do
      test_cd = CD.create({:band => "The Beatles", :album => "The White Album", :year => "1968", :genre => "rock"})
      test_cd2 = CD.create({:band => "Britney Spears", :album => "Toxic", :year => "2002", :genre => "pop"})
      test_cd3 = CD.create({:band => "Britney Spears", :album => "In The Zone", :year => "2002", :genre => "pop"})
      CD.search("band", "Britney Spears").should eq [test_cd2, test_cd3]
    end
  end
end
