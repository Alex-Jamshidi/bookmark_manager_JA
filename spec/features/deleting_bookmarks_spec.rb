feature 'Deleting Bookmarks' do
  scenario 'a user can delete stored bookmarks' do
    
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
    bookmark = Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'DAS')
    Bookmark.create(url: 'http://www.google.com', title: 'Google')
    visit('/bookmarks')
    find_by_id(bookmark.id).click
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to_not have_link('DAS', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end