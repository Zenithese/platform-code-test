Award = Struct.new(:name, :expires_in, :quality) do

    # def limit
    #     self.quality > 50 ? 50 : self.quality < 0 ? 0 : self.quality 
    # end

    def appreciate
        self.quality -= 1
    end

    def age
        self.expires_in -= 1
    end

end

class BlueFirst < Award
    # increase in quality the older they get
    def appreciate
        self.expires_in > 0 ? self.quality += 1 : self.quality += expires_in.abs() if self.quality < 50
    end

end

class BlueDistinctionPlus < Award
    # never decreases in quality / being highly sought, its quality is 80 and it never alters.
    def appreciate
        self.quality = 80
    end

end

class BlueCompare < Award
    # Quality increases by 2 when there are 10 days or less left, and by 3 where there are 5 days or less left, but quality value drops to 0 after the expiration date.
    def appreciate
        self.expires_in <= 10 ? self.quality += 2 : self.expires_in <= 5 ? self.quality += 3 : self.expires_in <= 0 ? self.quality = 0 : self.quality += 1
    end

end

class BlueStar < Award
    # lose quality value twice as fast as normal awards
    def appreciate
        self.expires_in > 0 ? self.quality -= 2 : self.quality -= ( self.expires_in.abs() * 2 )
    end

end