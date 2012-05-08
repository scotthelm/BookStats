require './book_parser.rb'
require './book.rb'
require './chapter.rb'

book_path = ARGV[0]

bp = BookParser.new
b = bp.parse book_path
File.delete("#{book_path}.stats.txt") if File.exists?("#{book_path}.stats.txt")

open("#{book_path}.stats.txt", 'a') do |f|
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

puts "-- created file: #{book_path}.stats.txt"
