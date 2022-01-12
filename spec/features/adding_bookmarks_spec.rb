feature 'Adding Bookmarks' do
  scenario 'user can add a bookmark' do
    visit('/bookmarks/new-bookmark')
    fill_in 'title', with: 'Amazon'
    fill_in 'url', with: 'http://www.amazon.co.uk'
    click_button 'Submit'
    
    expect(page).to have_link('Amazon')
  end
end 
    
