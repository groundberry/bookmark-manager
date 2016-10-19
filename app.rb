require 'sinatra/base'
require_relative 'app/models/link'

class BookmarkManager < Sinatra::Base

  get '/links/new' do
    erb :'links/new-link'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

  run! if app_file == $0

end