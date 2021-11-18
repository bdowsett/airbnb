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


   def self.find_account_id(username)
		accounts = Account.all
      
      accounts.each do |account|
         print account.id
      return account.id.to_i if account.username == username
      end
	end

   def self.find_account_username(account_id)
		accounts = Account.all
      accounts.each do |account|
      return account.username if account.id == account_id.to_s
      end
	end
end
