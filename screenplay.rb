class Screenplay
  attr_accessor :title, :author, :scenes, :characters, :time_in_seconds
  
  def initialize
    @time_in_seconds = 0
  end

  def process_line line
    # determine if this is a scene or not
    line.strip!
    if line =~ /^\d.*\d/
      
      @scenes = [] if @scenes.nil?
      @current_scene = Scene.new(line.strip)
      @scenes << @current_scene
    else
      if @current_scene.nil?
        
        @title = line if @title.nil? && !line.empty?
        @author = line if !@title.nil? && !line.empty?
      else
        @current_scene.process_line line.strip
      end
    end
  end

  def total_description_words
    total_description_words = 0
    @scenes.each do |s|
      total_description_words += s.word_count
    end
    return total_description_words
  end

  
  def total_dialog
    dialog = 0
    @scenes.each do |s|
      s.characters.each do |c|
        dialog += c.word_count
      end
    end
    dialog
  end

  def time (denomination)
    @scenes.each do |s|
      @time_in_seconds += s.time_in_seconds
    end

    return @time_in_seconds/60 if denomination == :minutes
    return @time_in_seconds if denomination == :time_in_seconds

  end
end