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

  def update()
    sql = "UPDATE types
    SET
    (
      type_name
    ) =
    (
      $1
    )
    WHERE id = $2"
    values = [@type_name, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM types
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    types = Type.new(result)
    return types
  end

  def self.all()
    sql = "SELECT * FROM types"
    types_data = SqlRunner.run(sql)
    types = map_items(types_data)
    return types
  end

  def self.delete_all()
    sql = "DELETE FROM types"
    SqlRunner.run(sql)
  end

  def self.map_items(types_data)
    return types_data.map { |type| Type.new(type) }
  end

end
