class Book
  attr_accessor :title, :author, :chapters
  def initialize
    @chapters = []
  end
  @current_chapter = nil

  def process_line line
    words = line.split
    # determine if this is a chapter line or not
    if words[0] =~ /^#/
      @chapters = [] if @chapters.nil?
      line.slice!(0)
      @current_chapter = Chapter.new(line.lstrip)
      @chapters << @current_chapter #unless @current_chapter.nil?
    else
      if @current_chapter.nil?
        line.rstrip!
        @title = line if @title.nil? && !line.empty?
        @author = line if !@title.nil? && !line.empty?
      else
        words.each do |word|
          @current_chapter.add_word word.downcase.gsub(/[(,;?!\'":.)]/, '').gsub(' ', '-').gsub(/-$/, '')
        end
      end
    end
  end

  def total_word_count
    count = 0
    @chapters.each do |c|
      count += c.word_count
    end
    return count
  end

  def words
    word_hash = {}
    @chapters.each do |c|
      c.words.keys.each do |key|
        if word_hash.has_key? key
          word_hash[key] = word_hash[key] + c.words[key]
        else
          word_hash[key] = 1
        end
      end
    end
    return word_hash
  end

  def average_chapter_words
    total_word_count / @chapters.size
  end
end