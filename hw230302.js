(1) найти ко-во завершенных транзакций не в евро на сумму более 100

db.transactions.countDocuments(
    { 'currency': {'$ne':'eur'}, 
      'amount': { '$gt': 100 },
      'is_completed': true }
)


(2) для всех пользователей не из Китая и не из Испании увеличить баланс на 20%
db.users.updateMany(
    {
        "country": { "$nin": ["Spain", "China"] }
    },
    {
        "$mul": { "balance": 1.2 }
    }
)

(3) разблокировать пользователей, у которых баланс больше нуля или премиальный статус
db.users.updateMany(
    {
      '$or': [
        { "balance": { "$gt": 0 },
        { 'is_premium : true}
      ]},
        { "$unset": { "is_blocked": null } 
)


(4) найти пользователей из Китая, которые заблокированы и имеют нулевой баланс
db.accounts.find(
{
    'country' : 'China',
    '$and' : [
            { 'balance': 0},
            { "is_blocked": true}
             ] 
}
)
(5) пользователям не из Китая и не из США, имеющим баланс более 5000, установить статус премиум
 db.users.updateMany(
    { "balance": { "$gt": 5000 },
      "country": { "$nin": ["USA", "China"]
      },
        { "$set": { "is_premium": true }
} 
)