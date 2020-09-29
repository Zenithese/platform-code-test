Award = Struct.new(:name, :expires_in, :quality) do

    def limit
        quality > 50 ? 50 : quality < 0 ? 0 : quality 
    end

end
