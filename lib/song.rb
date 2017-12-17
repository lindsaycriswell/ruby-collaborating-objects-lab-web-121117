class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist_name=(artist_name)
    # if (self.artist.nil?)
    #   self.artist = Artist.new(artist_name)
    # else
    #   self.artist.name = artist_name
    # end
    self.artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(self)
  end

  def self.new_by_filename(filename)
    f = filename.split(" - ")
    song = self.new(f[1])
    song.artist_name = f[0]
    song
  end
end
