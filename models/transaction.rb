require_relative('../db/sql_runner')
require_relative('./type.rb')

class Transaction

  attr_accessor :type_id, :merch_id, :value
  attr_reader :id, :trans_date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type_id = options['type_id'].to_i
    @merch_id = options['merch_id'].to_i
    @value = options['value'].to_i
    @trans_date = options['trans_date']
  end


  def save()
      sql = "INSERT INTO transactions
      (
        type_id,
        merch_id,
        value,
        trans_date
      )
      VALUES
      (
        $1, $2, $3, $4
      )
      RETURNING id"
      values = [@type_id, @merch_id, @value, @trans_date]
      result = SqlRunner.run(sql, values)
      id = result.first["id"]
      @id = id.to_i
    end

  def type()
    type = Type.find(@type_id)
    return type
  end

  def merchant()
    merchant = Merchant.find(@merch_id)
    return merchant
  end

  def update()
    sql = "UPDATE transactions
    SET
    (
      type_id,
      merch_id,
      value,
      trans_date
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@type_id, @merch_id, @value, @trans_date, @id]
    SqlRunner.run(sql, values)
  end


  def self.total
    array = self.all()
    total = 0
    array.map{|price| total += price.value}
    return total
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

    def self.delete_all()
      sql = "DELETE FROM transactions"
      SqlRunner.run(sql)
    end

    def self.destroy(id)
      sql = "DELETE FROM transactions
      WHERE id = $1"
      values = [id]
      SqlRunner.run( sql, values )
    end

    def self.map_items(transaction_data)
      return transaction_data.map { |transaction| Transaction.new(transaction) }
    end




end
