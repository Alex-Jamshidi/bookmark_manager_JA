feature 'Updating Bookmarks' do
  scenario 'user can update a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'DAS')
    visit('/')
    expect(page).to have_link('DAS', href: 'http://www.destroyallsoftware.com')

    first(".bookmark").click_button('Edit')
    first(".bookmark").fill_in 'title', with: 'Amazon'
    first(".bookmark").fill_in 'url', with: 'http://www.amazon.co.uk'
    first(".bookmark").click_button('Update')

    expect(page).to_not have_link('DAS', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Amazon', href: 'http://www.amazon.com')
  end
end



