require './book_parser.rb'
require './book.rb'
require './chapter.rb'
require './screenplay_parser.rb'
require './screenplay.rb'
require './scene.rb'
require './character.rb'

$book_path = ARGV[0]
$type = ARGV[1]

def parse_book
  bp = BookParser.new
  b = bp.parse $book_path
  File.delete("#{$book_path}.stats.txt") if File.exists?("#{$book_path}.stats.txt")

  open("#{$book_path}.stats.txt", 'a') do |f|
    f.puts b.title
    f.puts b.author
    f.puts "total words: #{b.total_word_count}"
    f.puts "average words per chapter: #{b.average_chapter_words}"
    b.chapters.each do |c|
      f.puts ""
      f.puts c.title
      f.puts "words: #{c.word_count}"
      f.puts "distinct words: #{c.words.keys.size}"
      
    end  
  end

  puts "-- created file: #{$book_path}.stats.txt"
end
def parse_screenplay
  spp = ScreenplayParser.new
  sp = spp.parse $book_path
  File.delete("#{$book_path}.stats.txt") if File.exists?("#{$book_path}.stats.txt")
  open("#{$book_path}.stats.txt", 'a') do |f|
    f.puts sp.title
    f.puts "---------------------------------------------"
    f.puts "total descriptions: #{sp.total_description_words}"
    f.puts "total dialog: #{sp.total_dialog}"
    f.puts "estimated total time in minutes: #{sp.time :minutes}"
    f.puts "---------------------------------------------"
    
    #f.puts "total words: #{b.total_word_count}"
    #f.puts "average words per chapter: #{b.average_chapter_words}"
    
    sp.scenes.each do |s|
      f.puts "--------------------------------------------"
      f.puts s.title
      f.puts "words: #{s.word_count}"
      f.puts "distinct words: #{s.words.keys.size}"
      f.puts "estimated time in seconds: #{s.time_in_seconds}"
      s.characters.each do |c|
        f.puts "#{c.name} - #{c.words.size}"
      end
      #f.puts "-------------------------------------------"
    end 
  end

  puts "-- created file: #{$book_path}.stats.txt"  
end
if $type == "screenplay"
  parse_screenplay
else
  parse_book
end