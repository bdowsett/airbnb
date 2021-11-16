

describe Space do
    it "stores a new listing with name, description, location & price" do 
    Space.create("house", "nice", "wales", 20)
    expect(Space.all.first.name).to eq "house"
    end 
end 