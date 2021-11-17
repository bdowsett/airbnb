feature 'User can check if date is available to book' do

    scenario 'Dates that are already booked are no longer available' do
        visit('/')





        click_link 'Add listing'
        fill_in :space_name, with: 'Dodgey Cottage' 
        fill_in :description, with: 'Enter at your own risk'
        fill_in :location, with: 'Reading'
        fill_in :price, with: 0
        click_button 'Add space'

        click_link 'Make booking'
        fill_in :space_name, with: 'Dodgey Cottage' 
        fill_in :date, with: Date.today + 1
        click_button 'Book space'

        click_link 'Return home'


        click_link 'Make booking'
        fill_in :space_name, with: 'Dodgey Cottage' 
        fill_in :date, with: Date.today + 1
        click_button 'Book space'




        expect(page).to have_content 'already booked'

   end
   
   end
