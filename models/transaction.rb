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

  def update()
    sql = "UPDATE transactions
    SET
    (
      type_id,
      merchant_id,
      value
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@type_id, @merchant_id, @value, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
      sql = "SELECT * FROM transactions
      WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql ,values).first
      transaction = Transaction.new(result)
      return transaction
    end

    def self.all()
      sql = "SELECT * FROM transactions"
      transaction_data = SqlRunner.run(sql)
      transactions = map_items(transaction_data)
      return transactions
    end

    def self.map_items(transaction_data)
      return transaction_data.map { |transaction| Transaction.new(transaction) }
    end




end
