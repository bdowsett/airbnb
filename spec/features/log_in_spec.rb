feature 'log in' do

  scenario 'user can log in' do

    visit '/'
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
    
    expect(page).to have_content 'Welcome Mr Dodgey'

  end

end
