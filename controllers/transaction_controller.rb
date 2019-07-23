require('sinatra')
require('sinatra/reloader')
require('pry')
require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')
require_relative('../models/type.rb')

also_reload('../models/*')

#view all transactions
get '/transactions/' do
  @transactions = Transaction.all
  @total_transactions = Transaction.total()
  erb(:"transactions/index")
end

#create new transaction
get '/transactions/new' do
  @merchants = Merchant.all
  @type = Type.all
  erb(:"transactions/new")
end

post '/transactions/' do
  Transaction.new(params).save
  redirect to '/transactions/'
end


#find transaction
get '/transactions/:id' do
  @transactions = Transaction.find(params['id'])
  erb(:"transactions/show")
end

#edit transaction
get '/transactions/:id/edit' do
  @type = Type.all
  @merchants = Merchant.all
  @transactions = Transaction.find(params['id'])
  @merchant = Merchant.find(params['id'])
  erb(:"transactions/edit")
end

post '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to "/transactions/#{params['id']}"
end

post '/transactions/:id/delete' do
  Transaction.destroy(params[:id])
  redirect to "/transactions/"
end

get '/merchant/' do
  @merchants = Merchant.all
  erb(:"merchant/index")
end

#add merchant
get '/merchant/new' do
  erb(:"merchant/new")
end


post '/merchant/' do
  Merchant.new(params).save
  redirect to '/merchant/'
end

get '/types/' do
  @type = Type.all
  erb(:"types/index")
end
