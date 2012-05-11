require './has_words.rb'
class Chapter
  include HasWords
  attr_accessor :words, :title
  def initialize(t)
    @title = t
  end
  
end