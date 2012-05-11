require './screenplay.rb'
class ScreenplayParser
  def parse path
    sp = Screenplay.new
      data = File.read(path).gsub(/\n?\r/, "\n").lines.to_a
      data.each do |s|
        sp.process_line s
      end
    return sp
  end
end