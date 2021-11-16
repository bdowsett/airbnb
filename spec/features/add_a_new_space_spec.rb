feature 'User is able to list a new space' do

scenario 'User can add a new listing with name, description, location and price' do
    visit('/')
    click_link 'Add listing'
    fill_in :space_name, with: 'Dodgey Cottage' 
    fill_in :description, with: 'Enter at your own risk'
    fill_in :location, with: 'Reading'
    fill_in :price, with: 'Free'
    click_button 'Add space'
    expect(page).to have_content 'Dodgey Cottage'
    expect(page).to have_content 'Enter at your own risk'
    expect(page).to have_content 'Reading'
    expect(page).to have_content 'Free'
end

end