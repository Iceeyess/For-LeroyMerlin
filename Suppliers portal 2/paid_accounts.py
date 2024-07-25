import json

with open('paid_accounts.json', mode='r', encoding='utf-8') as f:
    file = json.load(f)
amount = 0
length_string = 0
for x in file:
    amount += float(x['grossAmount'])
    length_string += 1
print('Общая сумма:', amount, 'Кол-во строк:', length_string)