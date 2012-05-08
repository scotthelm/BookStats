class Chapter
  attr_accessor :words, :title
  def initialize(t)
    @title = t
  end
  def word_count
    count = 0
    @words.keys.each do |key|
      count += @words[key]
    end
    return count
  end
  def add_word word
    @words = {} if words.nil?
    if @words.has_key? word
      @words[word] = @words[word] + 1
    else
      @words[word] = 1
    end
  end
end