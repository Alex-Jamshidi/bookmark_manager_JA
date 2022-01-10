feature 'Viewing Bookmarks' do
  scenario 'a user can view stored bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content("www.example.com")
    expect(page).to have_content("www.example.co.uk")
    expect(page).to have_content("www.example.org")
  end
end