require('sinatra')
require('sinatra/reloader')
require_relative('controllers/transaction_controller.rb') 

get '/' do
  erb( :index )
end
