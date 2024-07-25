import time
import requests
import datetime
import concurrent.futures

HOST = 'https://orchestrator-apifinrep-preprod-stage.platformeco.lmru.tech'
API_PATH = '/accounts_classified_by_date'
ENDPOINT = HOST + API_PATH
params = {'date_from': '20240601', 'date_to': '20240930', 'uniquePartnerIdentifier': '10014034', 'accountStatus': 'Все'}
MAX_THREADS = 2500
CONCURRENT_THREADS = 50

def send_api_request():
    print ('Sending API request: ', ENDPOINT)
    r = requests.get(ENDPOINT, params=params)
    print ('Received code + seconds: ', r.status_code, r.elapsed.total_seconds())

start_time = datetime.datetime.now()
print ('Starting:', start_time)

with concurrent.futures.ThreadPoolExecutor(MAX_THREADS) as executor:
    futures = [executor.submit(send_api_request) for x in range (CONCURRENT_THREADS)]
end_time = datetime.datetime.now()
print ('Finished start time:', start_time, 'duration: ', end_time-start_time)
