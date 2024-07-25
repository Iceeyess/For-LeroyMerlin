from pandas import pandas as pd

excel_model = pd.read_excel('verification_list.xlsx', 'Лист1', index_col=0)
search_phrase = 'Продажа/покупка валюты. Банковский номер сделки FX_42543. Курс сделки: 102.83000000. Пара валют по сделке: EUR/RUR'
for index, elem in enumerate(excel_model['Фраза для поиска'], 1):
    modified_search_words = [_ for _ in elem.strip('%').split('%') if _]
    counter = 0
    for word in modified_search_words:
        if word and word in search_phrase:
            counter += 1
    if counter == len(modified_search_words):
        print('Порядковый номер', index, 'Ключевое слово', modified_search_words)
