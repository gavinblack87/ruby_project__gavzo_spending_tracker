require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')
require_relative('../models/type.rb')

Transaction.delete_all()
Merchant.delete_all()
Type.delete_all()

merchant1 = Merchant.new({'merch_name' => 'Amazon'})
merchant2 = Merchant.new({'merch_name' => 'Tesco'})

merchant1.save()
merchant2.save()

type1 = Type.new({'type_name' => 'Entertainment'})
type2 = Type.new({'type_name' => 'Groceries'})
type3 = Type.new({'type_name' => 'Bills'})
type4 = Type.new({'type_name' => 'Eating out'})
type5 = Type.new({'type_name' => 'Shopping'})
type6 = Type.new({'type_name' => 'Finances'})
type7 = Type.new({'type_name' => 'Family'})
type8 = Type.new({'type_name' => 'General'})


type1.save()
type2.save()
type3.save()
type4.save()
type5.save()
type6.save()
type7.save()
type8.save()

transaction1 = Transaction.new({
   'type_id' => type2.id,
   'merch_id' => merchant1.id,
   'value' => 11,
   'trans_date' => '01/01/2000'
   })

transaction2 = Transaction.new({
  'type_id' => type1.id,
  'merch_id' => merchant2.id,
  'value' => 22,
'trans_date' => '02/02/2002'
  })

transaction1.save()
transaction2.save()
