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
    @bookmarks = Bookmark.all
    erb :'/bookmarks/index'
  end
  
  get '/bookmarks/new-bookmark' do
    erb :'/bookmarks/new_bookmark'
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
