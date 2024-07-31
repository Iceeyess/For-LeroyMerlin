from pandas import pandas as pd

excel_model = pd.read_excel('verification_list.xlsx', 'Лист1', index_col=0)
search_phrase = '(ИНН 5029069967; КПП 502901001) ошибочно перечисленные денежные средства по документу - Взыскание с Габисова Ольга Александровна по исполнительному документу35373/24/63040-ИП от 18.04.2024 в пользу ООО Премьер'
for index, elem in enumerate(excel_model['Фраза для поиска'], 1):
    modified_search_words = [_ for _ in elem.strip('%').split('%') if _]
    counter = 0
    for word in modified_search_words:
        if word and word in search_phrase:
            counter += 1
    if counter == len(modified_search_words):
        print('Порядковый номер', index, 'Ключевое слово', modified_search_words)
