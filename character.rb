require './has_words.rb'
class Character
  include HasWords
  attr_accessor :name, :words
  
  def initialize(name)
    @name = name
    @words = {}
  end
end