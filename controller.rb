require('sinatra')
require('sinatra/reloader')
require_relative('models/merchant.rb')
require_relative('models/transaction.rb')
also_reload('./models/*')


get '/transactions' do
  @transactions = Transactions.all
  erb(:index)
end
