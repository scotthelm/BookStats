class BookParser
  def parse path
    book = Book.new
      f = File.open(path)
      f.each_line do |s|
        book.process_line s
      end
    return book
  end
end