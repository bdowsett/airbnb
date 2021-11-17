require 'pg'

class Account 
 attr_reader :username, :email, :mob, :password


def initialize(username, email, mob, password)
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
     Account.all.each { |account | return :signup_failed if account.username == username || account.email == email}
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
     account['username'], account['email'], account['mob'].to_i, account['password']) }

end 
end 