require 'pg'
require './lib/account'

class Space

   attr_reader :id, :name, :desc, :location, :price, :account_id

   def initialize(id, name, desc, location, price, account_id)
     @id = id
     @name = name
     @desc = desc
     @location = location
     @price = price
     @account_id = account_id
   end

   def self.create(name, desc, location, price, account_id)
      if ENV['RACK_ENV'] == 'test'
         connection = PG.connect(dbname: 'airbnb_test')
      else
         connection = PG.connect(dbname: 'airbnb')
      end
      connection.exec_params('INSERT INTO spaces (name, description, location, price, account_id) VALUES ($1, $2, $3, $4, $5);', [name, desc, location, price, account_id])
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
        space['price'], space['account_id']) }
   end
end 




#find acct id self.find_account_id(username) pass session[current_username]
#account_id = self.find_account_id(username) pass session[current_username]