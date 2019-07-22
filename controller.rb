require('sinatra')
require('sinatra/reloader')
require_relative('models/merchant.rb')
require_relative('models/transaction.rb')
also_reload('./models/*')


get '/transactions' do
  @transactions = Transaction.all
  erb(:index)
end

get '/transactions/new' do
  @merchants = Merchant.all
  @type = Type.all
  erb(:new)
end

get '/transactions/:id' do
  @transactions = Transaction.find(params['id'])
  erb(:show)
end

get '/transactions/:id/edit' do
  @type = Type.all
  @merchants = Merchant.all
  @transactions = Transaction.find(params['id'])
  @merchant = Merchant.find(params['id'])
  erb(:edit)
end

post '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to "/transactions/#{params['id']}"
end
