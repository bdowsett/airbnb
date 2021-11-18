require 'pg'


class Booking

	attr_reader :name, :date, :account_id

	def initialize(name, date, account_id)
		@name = name 
		@date = date
		@account_id = account_id
	end 
	
	def self.create(name, date, account_id)
		if ENV['RACK_ENV'] == 'test'
			connection = PG.connect(dbname: 'airbnb_test')
		else
			connection = PG.connect(dbname: 'airbnb')
		end
		Booking.all.each { |booking| return :booking_failed if booking.date == date && booking.name == name }
		connection.exec_params('INSERT INTO bookings (name, date, account_id) VALUES ($1, $2, $3);', [name, date, account_id])
		return :booking_successful
	end

	def self.all
		if ENV['RACK_ENV'] == 'test'
			connection = PG.connect(dbname: 'airbnb_test')
		else
			connection = PG.connect(dbname: 'airbnb')
		end
		result = connection.exec("SELECT * FROM bookings;")
		result.map { |booking| Booking.new(
		booking['name'], booking['date'], booking['account_id']) }
	end 

end 