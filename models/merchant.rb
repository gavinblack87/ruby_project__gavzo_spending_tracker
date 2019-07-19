require_relative('../db/sql_runner')

class Merchant

  attr_accessor :merch_name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merch_name = options['merch_name']
  end




end
