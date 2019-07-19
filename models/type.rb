require_relative('../db/sql_runner')

class Type

  attr_accessor :type_name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type_name = options['type_name']
  end




end
