feature "Account page view" do 
    scenario "users logs in and is presented with account page" do
      
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

        expect(page).to have_content "Welcome to your account page, Mr Dodgey"
        expect(page).to have_link "Messages"
    end 
end 
