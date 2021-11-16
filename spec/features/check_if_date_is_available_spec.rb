xfeature 'User can check if date is available to book' do

    scenario 'Dates that are already booked are no longer available' do
        visit('/')
        click_link 'Make booking'


        


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
