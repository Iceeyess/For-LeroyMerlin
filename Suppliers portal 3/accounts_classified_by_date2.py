import json

with open('accounts_classified_by_date2.json', mode='r', encoding='utf-8') as f:
    file = json.load(f)
amount = 0
length_row = 0
for x in file:
    amount += float(x['grossAmount'])
    length_row += 1
print('Общая сумма:', amount, 'Кол-во строк:', length_row)