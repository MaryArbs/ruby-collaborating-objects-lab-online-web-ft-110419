class Artist
  attr_accessor :name, :songs

  @@all=[]

  def initialize(name)
    @name = name
    @@all << self

  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def save
    @@all << self
    self
  end

  def songs
   Song.all.select {|song| song.artist == self}
  end

  def add_song(song_one)
   song_one.artist = self
  end

  def self.find_or_create_by_name(name)   #class method uses find/create class
                                            #methods to detect or create instances
      if self.find(name)
        self.find(name)
      else
        self.create(name)
      end
    end

    def self.find(name)     #class method detects instances from @@all class variable
      self.all.detect { |artist| artist.name == name }
    end

    def self.create(name)
      artist = Artist.new(name)
      artist.save
      artist
    end
  # def self.find_or_create_by_name(file_name)
  #  self.all.find {|artist| artist.name == name} || self.new(name).save
  # #  always returns an Artist instance
  # #   finds or creates an artist by name maintaining uniqueness of objects by name property
  # #   Creates new instance of Artist if none exist
  # end


    def print_songs
      self.songs.each {puts |song| song.name}
    end



end
