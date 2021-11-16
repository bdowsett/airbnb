require 'pg'

class Space
    @@listings = []

    def self.create(name, desc, location, price)

       connection = PG.connect(dbname: 'airbnb')
       connection.exec_params('INSERT INTO spaces (name, description, location, price) VALUES ($1, $2, $3, $4);', [name, desc, location, price])
    end 

    def self.all
       @@listings
    end 
end