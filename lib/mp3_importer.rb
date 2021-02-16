require 'pry'

class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        current_dir = Dir.getwd
        Dir.chdir(@path)
        filename = Dir.glob('*.mp3')
        Dir.chdir(current_dir)
        filename
      
    end

    def import
        array = files
        array.each do |filename|
            Song.new_by_filename(filename)
        end
        
    end
end