feature 'User can check if date is available to book' do

    scenario 'Dates that are already booked are no longer available' do
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
