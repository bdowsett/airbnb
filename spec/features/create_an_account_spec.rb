feature 'As a user I can create an account' do

scenario 'I can enter a username, email, mobile number and password to create an account' do

visit('/')
click_link 'Create an account'
fill_in :username, with: 'Mr Dodgey' 
fill_in :email, with: 'mr_dodgey@gmail.com'
fill_in :mob, with: '07985674834' 
fill_in :password, with: 'Dodgey_is_best' 
click_button 'Create account'

expect(page).to have_content 'Account creation successful'
expect(page).to have_link 'Log in'

end
end