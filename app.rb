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

get '/store/:id' do
  @store=Store.find(params.fetch('id').to_i)
  @allbrands=Brand.all
  @brands=Brand.joins(:stocks).where(stocks:{store_id: @store.id})
  erb :store_details
end

get '/brand/:id' do
  @brand=Brand.find(params.fetch('id').to_i)
  @stores=Store.joins(:stocks).where(stocks:{brand_id: @brand.id})
  erb :brand_details
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

post '/stores/new_stock' do
  brand_id=params.fetch('select')
  store_id=params.fetch('store_id')
  Stock.create(brand_id: brand_id, store_id:store_id)
  redirect '/store/'.concat(store_id.to_s)
end
