

describe Space do
    it "stores a new listing with name, description, location & price" do 
    Account.create("Ben", "email", "100000", "password" )
    account_id = Account.find_account_id("Ben")
    Space.create("house", "nice", "wales", 20, account_id)
    expect(Space.all.first.name).to eq "house"
    end 
end 