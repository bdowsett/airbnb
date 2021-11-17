require 'pg'

p 'Setting up test database...'

def setup_test_database
  connection = PG.connect(dbname: 'airbnb_test')
  connection.exec('TRUNCATE spaces, bookings, accounts;')
end