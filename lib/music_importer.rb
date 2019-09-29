require 'pry'
 


class MusicImporter
  attr_accessor :name 
  
  @@files = []
  def initialize(path)
    @path = path 
    @name = name 
     
  end 
  
  def path 
    @path 
  end 
  
  def files
 
       Dir.entries(path).select do |file| 
         file.end_with?(".mp3")
       end 
 
  end 
  
  
end 