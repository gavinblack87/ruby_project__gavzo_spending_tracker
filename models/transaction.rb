require_relative('../db/sql_runner')

class Transaction

  attr_accessor :type_id, :merch_id, :value
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type_id = options['type_id'].to_i
    @merch_id = options['merch_id'].to_i
    @value = options['value'].to_i
  end


  def save()
      sql = "INSERT INTO transactions
      (
        type_id,
        merch_id,
        value
      )
      VALUES
      (
        $1, $2, $3
      )
      RETURNING id"
      values = [@type_id, @merch_id, @value]
      result = SqlRunner.run(sql, values)
      id = result.first["id"]
      @id = id.to_i
    end




end
