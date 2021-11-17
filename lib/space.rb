require 'pg'

class Space

   attr_reader :id, :name, :desc, :location, :price

   def initialize(id, name, desc, location, price)
     @id = id
     @name = name
     @desc = desc
     @location = location
     @price = price
   end

   def self.create(name, desc, location, price)
      if ENV['RACK_ENV'] == 'test'
         connection = PG.connect(dbname: 'airbnb_test')
      else
         connection = PG.connect(dbname: 'airbnb')
      end
      connection.exec_params('INSERT INTO spaces (name, description, location, price) VALUES ($1, $2, $3, $4);', [name, desc, location, price])
    end 

   def self.all
      if ENV['RACK_ENV'] == 'test'
         connection = PG.connect(dbname: 'airbnb_test')
      else
         connection = PG.connect(dbname: 'airbnb')
      end
     result = connection.exec("SELECT * FROM spaces;")
     result.map { |space| Space.new(
        space['id'], space['name'], space['description'], space['location'], 
        space['price']) }
   end

end
