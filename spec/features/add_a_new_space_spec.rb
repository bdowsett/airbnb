 feature 'User is able to list a new space' do

 scenario 'User can add a new listing with name, description, location and price' do
     visit('/')
     click_link 'Create an account'
     fill_in :username, with: 'Mr Dodgey' 
     fill_in :email, with: 'mr_dodgey@gmail.com'
     fill_in :mob, with: '07985674834' 
     fill_in :password, with: 'Dodgey_is_best' 
     click_button 'Create account'
   
     click_link 'Log in'
     fill_in :username, with: 'Mr Dodgey' 
     fill_in :password, with: 'Dodgey_is_best'
     click_button 'Log in'
     click_link 'Return home'
     click_link 'Add listing'
     fill_in :space_name, with: 'Dodgey Cottage' 
     fill_in :description, with: 'Enter at your own risk'
     fill_in :location, with: 'Reading'
     fill_in :price, with: 0
     click_button 'Add space'
    expect(page).to have_content 'Dodgey Cottage'
     expect(page).to have_content 'Enter at your own risk'
     expect(page).to have_content 'Reading'
     expect(page).to have_content 0
end

end