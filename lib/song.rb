require 'pry'
require_relative '../lib/concerns/findable.rb'


class Song 

  attr_accessor :name
   
  
  @@all = []
 
  def initialize(name)
    @name = name 
    save
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    @@all = []
  end 
  
  def save
    @@all << self 
  end 
  
  def self.create(name)
   self.new(name)
  end 
  
  
  
 def artist=(artist)
   @artist = artist
   artist.add_song(self)
    
 end 
 
 
 
 def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
 end 
  
  
  def self.find_by_name(name)
        
     @@all.detect do |song| 
       song.name == name 
     end 
  end 
  
  def self.create_by_name(song_name)
    self.create(song_name)
        
 end 


 
  def self.find_or_create_by_name(name)
 
    self.find_by_name(name) || self.create_by_name(name)  
  end 

  def self.new_from_filename(filename)
    parts = (filename.gsub(".mp3","").split(" - "))
    song = self.new(parts[1])
    song.artist = Artist.find_or_create_by_name(parts[0])
    song.genre = Genre.find_or_create_by_name(parts[2])
    song.save
    song
  end
  
  
  def self.create_from_filename(filename)
    
    song = Song.new(filename)
     
  end 
  
end 

#created_song = Song.create("Kaohsiung Christmas")