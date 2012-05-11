require './has_words.rb'
class Scene
  include HasWords
  attr_accessor :title, :number, :characters, :words

  def initialize(title)
    @title = title
    @characters = []
    @words = {}
  end

  def description_words
    @words
  end

  def process_line line
    if line =~ /^[^a-z]*$/ && !line.empty?
      echar = existing_character(line)
      if echar.nil?
        @current_character = Character.new(line)
        @characters << @current_character
      else
        @current_character = echar
      end
      
    elsif line.empty?
      @current_character = nil
    end
    
    words = line.split
    words.each do |word|
      
      if @current_character.nil?
        add_word word.downcase.gsub(/[(,;?!\'":.)]/, '').gsub(' ', '-').gsub(/-$/, '')
      else
        @current_character.add_word word
      end
    end
  end

  def existing_character(name)
    index = nil
    @characters.each do |char|
      if char.name == name
        index = char
      end
    end
    return index
  end
end