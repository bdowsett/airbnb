require 'pg'

class Booking
    attr_reader :name, :date
    def initialize(name, date)
        @name = name 
        @date = date
    end 
    
    def self.create(name, date)
        if ENV['RACK_ENV'] == 'test'
            connection = PG.connect(dbname: 'airbnb_test')
         else
            connection = PG.connect(dbname: 'airbnb')
         end
            Booking.all.each { |booking| return :booking_failed if booking.date == date && booking.name == name }
            connection.exec_params('INSERT INTO bookings (name, date) VALUES ($1, $2);', [name, date])
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
         booking['name'], booking['date']) }
    end 

end 