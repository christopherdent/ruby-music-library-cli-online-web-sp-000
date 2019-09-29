require 'pry'
require_relative '../lib/concerns/findable.rb'


class Artist 
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs 
  
  @@all = []
 
  def initialize(name)
    @name = name 
    @songs = []
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
  

  
  
  def add_song(song)
    if song.artist == nil 
      son.artist = self 
    end 
    if !@songs.include?(song)
      @song << song 
    end 
  end 
  
  
  def genres
    @g_array = [] 
    
    self.songs.collect do |song| 
     @g_array << song.genre  
    end   
      @g_array.uniq
  end 

  
  
end 