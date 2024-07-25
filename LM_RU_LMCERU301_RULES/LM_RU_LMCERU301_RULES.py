import pandas as pd
import os

# Проверка на совпадения правил выверки

file_path = 'LM_RU_LMCERU301_RULES.xlsx'
file = pd.read_excel(file_path)
# for account in file['FLEX_VALUE']:
lst_des = list(file['DESCRIPTION'])
lst_flex = list(file['FLEX_VALUE'])
result = []

for index in range(1, len(file['DESCRIPTION'])):
    if lst_des[index] in lst_des[:index]:
        i_1 = lst_des[:index].index(lst_des[index])
        if lst_flex[i_1].split('_')[0] == lst_flex[index].split('_')[0]:
            result.append((i_1, lst_des[i_1], lst_flex[i_1], index, lst_des[index], lst_flex[index]))
        # print(lst_des[i_1], lst_flex[i_1])
        # print(lst_des[index], lst_flex[index])
        # print(lst_des[i_1], lst_des[index])
    # account = account.split('_')[0].strip

with open('rules_match.txt', mode='w', encoding='utf-8') as f:
    for item in result:
        f.write(f'{item[0]} {item[1]} {item[2]} {item[3]} {item[4]} {item[5]}\n')