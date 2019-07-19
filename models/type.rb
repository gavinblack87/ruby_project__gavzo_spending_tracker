require_relative('../db/sql_runner')

class Type

  attr_accessor :type_name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type_name = options['type_name']
  end

  def save()
      sql = "INSERT INTO types
      (
        type_name
      )
      VALUES
      (
        $1
      )
      RETURNING id"
      values = [@type_name]
      result = SqlRunner.run(sql, values)
      id = result.first["id"]
      @id = id.to_i
    end




end
