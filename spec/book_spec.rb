describe Booking do
    it "creates a new booking" do
        Account.create("Ben", "email", "100000", "password" )
        account_id = Account.find_account_id("Ben")
        Booking.create("House", "2021-12-12", account_id)
        expect(Booking.all.first.name).to eq "House"
        expect(Booking.all.first.date).to eq "2021-12-12"
        expect(Booking.all.first.account_id).to eq account_id.to_s
    end 
end 
