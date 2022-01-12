feature 'Adding Bookmarks' do
  scenario 'user can add a bookmark' do
    visit('/bookmarks/new-bookmark')
    fill_in 'url', with: 'http://www.amazon.co.uk'
    click_button 'Submit'
    expect(page).to have_content('http://www.amazon.co.uk')
  end
end 
    
