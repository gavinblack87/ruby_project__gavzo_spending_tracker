require('sinatra')
require('sinatra/reloader')
require_relative('models/merchant.rb')
require_relative('models/transaction.rb')
also_reload('./models/*')


get '/transactions' do
  @transactions = Transaction.all
  erb(:index)
end

get '/transactions/:id' do
  @transactions = Transaction.find(params['id'])
  erb(:show)
end
