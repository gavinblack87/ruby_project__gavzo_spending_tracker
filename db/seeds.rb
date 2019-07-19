require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')
require_relative('../models/type.rb')

merchant1 = Merchant.new({'merch_name' => 'Amazon'})
merchant2 = Merchant.new({'merch_name' => 'Tesco'})

merchant1.save()
merchant2.save()

type1 = Type.new({'type_name' => 'Entertainment'})
type2 = Type.new({'type_name' => 'Groceries'})

type1.save()
type2.save()

transaction1 = Transaction.new({
   'type_id' => type2.id,
   'merch_id' => merchant1.id,
   'value' => 11 })

transaction2 = Transaction.new({
  'type_id' => type1.id,
  'merch_id' => merchant2.id,
  'value' => 22 })

transaction1.save()
transaction2.save()
