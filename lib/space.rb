class Space
    @@listings = []

    def self.create(name, desc, location, price)
        @@listings << [name, desc, location, price]
    end 

    def self.all
       @@listings
    end 
end