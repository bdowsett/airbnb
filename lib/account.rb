require 'pg'

class Account 

	attr_reader :username, :email, :mob, :password, :id

	def initialize(id, username, email, mob, password)
		@id = id
		@username = username 
		@email = email 
		@mob = mob 
		@password = password
	end

	def self.create(username, email, mob, password)
		if ENV['RACK_ENV'] == 'test'
			connection = PG.connect(dbname: 'airbnb_test')
		else
			connection = PG.connect(dbname: 'airbnb')
		end
		Account.all.each { |account | return :signup_failed if account.username == username || account.email == email }
		connection.exec_params('INSERT INTO accounts (username, email, mob, password) VALUES ($1, $2, $3, $4);', [username, email, mob, password])
		return :signup_successful
	end

	def self.all
		if ENV['RACK_ENV'] == 'test'
			connection = PG.connect(dbname: 'airbnb_test')
		else
			connection = PG.connect(dbname: 'airbnb')
		end
		result = connection.exec("SELECT * FROM accounts;")
		result.map { |account| Account.new(
		account['id'], account['username'], account['email'], account['mob'].to_i, account['password']) }
	end 

	def self.valid_account(username, password)
		if ENV['RACK_ENV'] == 'test'
			connection = PG.connect(dbname: 'airbnb_test')
		else
			connection = PG.connect(dbname: 'airbnb')
		end
		result = connection.exec("SELECT * FROM accounts;")
		result.each do |account| 
			return :account_page if account['username'] == username && account['password'] == password
		end
		return :login_failed
	end
 
	def self.find_account_id(username)
		accounts = Account.all
		accounts.each { |account| return account.id.to_i if account.username == username }
	end

   def self.find_account_username(account_id)
		accounts = Account.all
		accounts.each { |account| return account.username if account.id == account_id.to_s }
  end 
	
end 

