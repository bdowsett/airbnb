require 'account'

describe Account do
  it "creates a new user account" do
    Account.create("username", "email", 00000000000, "password")
    expect(Account.all.first.username).to eq "username"
    expect(Account.all.first.email).to eq "email"
    expect(Account.all.first.mob).to eq 00000000000
    expect(Account.all.first.password).to eq "password"
end 
end 