class MP3Importer

  attr_accessor :path, :file

  def initialize(path)
   @path=path
  end


  def files
    Dir.entries(path).select {|entry| entry.include?(".mp3")}
  end


  def import
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end
end
