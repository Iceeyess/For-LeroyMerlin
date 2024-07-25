from requests import request
from json import dump, dumps
from time import time

################################################################
# Цикл итераций к API
################################################################
quantity = 50
method1 = '/accounts_classified_by_date'
method2 = '/paid_accounts'
method3 = '/accounts_confirmed_for_payment'
method4 = '/search_by_account'
url = 'https://orchestrator-apifinrep-preprod-stage.platformeco.lmru.tech' + method4
params1 = {'date_from': '20240601', 'date_to': '20240930', 'uniquePartnerIdentifier': '10014034',
           'accountStatus': 'Все'}
params2 = {'date_from': '20240601', 'date_to': '20240930', 'uniquePartnerIdentifier': '10014034',
           'accountStatus': 'Все'}
params3 = {'date_from': '20240601', 'date_to': '20240930', 'uniquePartnerIdentifier': '10014034',
           'accountStatus': 'Все'}
params4 = {'date_from': '20240601', 'date_to': '20240930', 'uniquePartnerIdentifier': '10014034',
           'accountStatus': 'Все', 'num': 2056}

temp_dictionary = {}
time_result = 0
start_time = time()
end_time = time()
delta_time = end_time - start_time

for attempt in range(1, quantity + 1):
    d_temp = {}
    response = request('GET', url, params=params4)
    temp_dictionary |= {f"Попытка №{attempt}": {"Код ответа": response.status_code, "Время ответа(сек)":
        response.elapsed.total_seconds()}}
with open('accounts_classified_by_date.txt', mode='w', encoding='utf-8') as file:
    s = dumps(temp_dictionary)
    file.write(s)
    dump(temp_dictionary, file, ensure_ascii=False)
print(temp_dictionary)
