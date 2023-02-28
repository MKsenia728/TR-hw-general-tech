db.users.unsertOne(
{
    'id':'u001',
    'fullname' : 'Ivan Ivanov',
    'created_at' : new Date(),
    'country' : 'Germany'
}
)
db.users.unsertOne(
{
    'id':'u005',
    'fullname' : 'Sergey Sidorov',
    'created_at' : new Date(),
    'country' : 'Germany'
}
)
db.users.insertOne(
    {
        'id': 'u001', 
    'fullname': 'Jan Lee', 
   'created_at': new Date(), 
   'country': 'China'   })
db.accounts.find(
{'user_id': 'u001'}
)
db.accounts.find(
{
    'currency': 'usd',
    'balance': {'$gte':10000, '$lte': 15000}
}
)
db.accounts.updateMany(
   {'balance': {'$gte':15000},"currency" : "usd",},
   {'$set' : {'is_premium':true}})
db.accounts.countDocuments(
    {'currency': 'eur',
    'balance': {'$gte':1000}}
)
db.accounts.countDocuments({'currency': 'eur','balance': {'$gte': 1000}})
db.goods.insertOne(
   {'title': 'Good 333',
       'price': 55,
       'id': 'g011','quantity': 30,
       'created_at': new Date()})
db.goods.updateOne(
{'id': 'g007'},
{'$inc': {'quantity': 500}}
)
db.goods.updateMany(
{'id': 'g001'}, // filter
   {'$inc': {'quantity': 5},
       '$set': {'price': 200},
       '$unset': {'is_blocked': null}} )// action

db.goods.updateMany(
{},
{'$mul':{'price: 0.85'}}
)
db.goods.updateMany(
{},
{'$mul':{'price: 1.2'}}
)
db.accounts.updateMany(
    {},
    {
        '$set': {
            'is_approved': true,
            'datetime.approved_at': new Date()
        }
    }
)
db.accounts.find(
{'is_approved': true,
   "currency" : "eur", 
},
{"balance": 1}
)
db.accounts.find(
{'is_approved': {'$exists': false},
   "currency" : "eur", 
}
)