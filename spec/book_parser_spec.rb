require './book_parser.rb'
require './book.rb'
require './chapter.rb'
require './has_words.rb'
require 'rspec'

describe Book do
  before(:all) do
    @bp = BookParser.new
    @book = @bp.parse 'test.txt'
  end

  it "should have a title" do
    @book.title.should == 'Test Title'
  end
  it "should have an author" do
    @book.author.should == 'Author'
  end
  it "should have a collection of chapters" do
    @book.chapters.size.should == 2
  end
  it "should have a total_word_count" do
    @book.total_word_count.should == 10
  end
  it "should have a word dictionary with word => count" do 
    @book.words.keys.count.should == 6
  end
end
