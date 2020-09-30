Award = Struct.new(:name, :expires_in, :quality) do

    def self.new(name, expires_in, quality)
        Object.const_get(name.split(" ").join("")).new(name, expires_in, quality)
    end

end

NORMALITEM = Struct.new(:name, :expires_in, :quality) do

    def limit
        self.quality > 50 ? self.quality = 50 : self.quality <= 0 ? self.quality = 0 : self.quality 
    end

    def appreciate
        self.expires_in > 0 ? self.quality -= 1 : self.quality -= 2
    end

    def age
        self.expires_in -= 1
    end

end

class BlueFirst < NORMALITEM
    # increase in quality the older they get
    def appreciate
        self.expires_in > 0 ? self.quality += 1 : self.quality += 2
    end

end

class BlueDistinctionPlus < NORMALITEM
    # never decreases in quality / being highly sought, its quality is 80 and it never alters.
    def limit; nil end

    def appreciate
        self.quality = 80
    end

    def age; nil end

end

class BlueCompare < NORMALITEM
    # Quality increases by 2 when there are 10 days or less left, and by 3 where there are 5 days or less left, but quality value drops to 0 after the expiration date.
    def appreciate
        if self.expires_in <= 0 
            self.quality = 0 
        elsif self.expires_in <= 10 && self.expires_in >= 6 
            self.quality += 2 
        elsif self.expires_in <= 5 
            self.quality += 3
        else
            self.quality += 1 
        end
    end

end

class BlueStar < NORMALITEM
    # lose quality value twice as fast as normal awards
    def appreciate
        self.expires_in > 0 ? self.quality -= 2 : self.quality -= 4
    end

end