require 'sinatra'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override
  
  get '/' do
    redirect '/bookmarks'
  end
  
  get '/bookmarks' do
    @bookmarks = Bookmark.all
    @visible = session[:visible]
    @visible_id = session[:visible_id]
    p "visible id coming up"
    p @visible

    erb :'/bookmarks/index'
  end
  
  get '/bookmarks/new-bookmark' do
    erb :'/bookmarks/new_bookmark'
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect('/bookmarks')
  end

  post '/delete' do
    Bookmark.delete(id: params[:delete_id])
    redirect('/bookmarks')
  end

  patch '/edit/:id' do
    session[:visible] = 'visible'
    session[:visible_id] = params[:id]
    p "session coming up"
    p session[:visible]
    redirect '/bookmarks'
  end

  patch '/update/:id' do
    session[:visible] = nil
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])

    redirect '/bookmarks'
  end

  run! if app_file == $0
end
