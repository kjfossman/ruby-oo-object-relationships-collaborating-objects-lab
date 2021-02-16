class Artist
    @@all = []
    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs 
        list = []
        Song.all.each do |x|
            if x.artist == self
                list << x
            end
        end
        return list
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        check = Artist.all.find { |x| x.name == name }
        
        if  check != nil 
            return check
        else
            Artist.new(name)
        end     
    end

    def print_songs
        list_of_songs = []
        songs.each do |x|
            list_of_songs << x.name
        end
        puts list_of_songs
    end
end