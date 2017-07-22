require 'bundler/setup'
Bundler.require(:default)
also_reload('lib/**/*.rb')

Dir[File.dirname(__FILE__)+"/../lib/*.rb"].each {|file| require file}

get '/' do
    erb :index
end

get '/brands' do
    @brands=Brand.all
    erb :brands
end

get '/stores' do
    @stores=Store.all
    erb :stores
end

post '/stores/new' do
    name=params.fetch('name')
    telephone=params.fetch('telephone')
    address=params.fetch('address')
    country=params.fetch('country')
    Store.create(name: name,telephone:telephone,address:address,country:country)
    redirect '/stores'
end

post '/brands/new' do
    name=params.fetch('name')
    category=params.fetch('category')
    gender=params.fetch('gender')
    Brand.create(name: name,category:category,gender:gender)
    redirect '/brands'
end