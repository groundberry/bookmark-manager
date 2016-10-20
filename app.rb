ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'app/data_mapper_setup'
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
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get "/tags/:name" do
    @links = Link.all(:tags => { :name => params[:name] })
    erb :'links/index'
  end

  run! if app_file == $0

end
