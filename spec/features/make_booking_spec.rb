feature 'User is able to make a booking' do

    scenario 'User can enter a name and a date of the booking they want to make' do
        
        visit('/')
        click_link 'Add listing'
        fill_in :space_name, with: 'Dodgey Cottage' 
        fill_in :description, with: 'Enter at your own risk'
        fill_in :location, with: 'Reading'
        fill_in :price, with: 0
        click_button 'Add space'

        click_link 'Make booking'
        fill_in :space_name, with: 'Dodgey Cottage'
        fill_in :date, with: '25/12/2021'
        click_button 'Book space'


        expect(page).to have_content 'Your booking has been made'
    
   end
   
   end