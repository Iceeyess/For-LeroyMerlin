# word = '*!*!*?'
# new_word = []
# numbers = 3
# d_dict = dict(а=3, н=2, с=1)
# for char in list(word):
#     word.count(char)


import pandas, os

path_ = os.path.join('R:', 'HQ', '500', '841', 'ТЕСТИРОВАНИЯ', 'Загрузка банковской выписки', '15-04-2024 GSS1RU',
                     'Statements for 10.04.2024.xlsx')
excel = pandas.read_excel(path_, index_col=0, sheet_name='Sheet0')
excel_sheet_2 = pandas.read_excel(path_, index_col=0, sheet_name='sheet2', header=0)
lst = [search for search in excel['BANK_ACCOUNT_NUMBER']]
lst2 = [search for search in excel_sheet_2['account_num']]
check = [True if _ in lst else _ for _ in excel_sheet_2['account_num'] ]
print(check)
