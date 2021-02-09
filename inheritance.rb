class Song
  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
  end
end

#inheritance usage with super keyword invoking parent class
class KaraokeSong < Song
  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration)
    @lyrics = lyrics
  end
end

# Class variables and Class menthods
class SongList
  MaxTime = 5*60     # -> Constant
  def SongList.isTooLong(aSong)
    return aSong.duration > MaxTime
  end
end

song1 = Song.new("Bicylops", "Fleck", 260)
SongList.isTooLong(song1)
song2 = Song.new("The Calling", "Santana", 468)
SongList.isTooLong(song2)
my_karaoke_song = KaraokeSong.new("My Way", "Sinatra", 225, "My Way song lyrics")
puts my_karaoke_song