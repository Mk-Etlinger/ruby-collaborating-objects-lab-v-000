class MP3Importer

  attr_accessor :path

  def initialize(filename)
    @path = filename
  end

  def files
    @files = Dir.entries(@path)
    @files.delete_if {|item| item == "." || item == ".."}
  end

  def import
    self.files.each do |file|
      song = Song.new_by_filename(file)
      Artist.all << song.artist unless Artist.all.include?(song.artist)
    end
  end

end
