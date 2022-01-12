require 'sinatra'
require 'sinatra/reloader'
require './lib/bookmark.rb'


class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  get '/' do
    redirect '/bookmarks'
  end
  
  get '/bookmarks' do
    # p ENV

    @bookmarks = Bookmark.all
    erb :'/bookmarks/index'
  end
  
  run! if app_file == $0

end
