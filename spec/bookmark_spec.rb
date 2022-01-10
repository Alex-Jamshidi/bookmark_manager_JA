require 'bookmark'

describe Bookmark do
	describe '.all' do
		it 'returns bookmarks' do
			bookmarks = Bookmark.all
			expect(bookmarks).to include("www.example.com")
			expect(bookmarks).to include("www.example.co.uk")
			expect(bookmarks).to include("www.example.org")
		end
	end
end