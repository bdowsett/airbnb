describe Booking do
    it "creates a new booking" do
        Booking.create("House", "2021-12-12")
        expect(Booking.all.first.name).to eq "House"
        expect(Booking.all.first.date).to eq "2021-12-12"
    end 
end 
