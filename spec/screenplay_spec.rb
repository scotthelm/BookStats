require 'rspec'
require './screenplay_parser.rb'
require './screenplay.rb'
require './scene.rb'
require './character.rb'
require './has_words.rb'

describe Screenplay do
  before(:all) do
    @spp = ScreenplayParser.new
    @sp = @spp.parse 'raiders.txt'
  end
  it "should have a title" do
    @sp.title.should == "RAIDERS OF THE LOST ARK"
  end
  it "has scenes" do
    @sp.scenes.should_not == nil
    @sp.scenes.size.should > 0
  end
  it "'s scenes have description_words" do
    @sp.scenes[0].description_words.should_not == nil
  end
  it "'s scenes have characters" do
    @sp.scenes[0].characters.should_not == nil
  end
  it "'s characters have names'" do
    @sp.scenes[0].characters[0].name.should_not == nil
  end
  it "'s characters have words'" do
    @sp.scenes[0].characters[0].words.should_not == nil
  end
  it "has description_words" do
    @sp.description_words.should_not == nil
  end
  it "has dialoge"
  it "has total_words"
  it "has characters"
end