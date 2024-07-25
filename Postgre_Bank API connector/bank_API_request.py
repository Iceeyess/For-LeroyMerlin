import requests, json, psycopg2
from POSTGRE_CONSTANTS import _parameters


def get_tokens_in_postgre(params: dict) -> tuple:
    """Функция получения access_token, id_token из Postgre"""
    connection = psycopg2.connect(**params)
    cur = connection.cursor()
    cur.execute("""SELECT access_token, id_token
                FROM public.token_storage
                WHERE source_id = 1""")
    access_token, id_token = cur.fetchone()
    return access_token, id_token


def get_statement_transaction(url_method: str, bank_acc_num: int, statement_date: str, id_token: str,
                              access_token: str) -> list:
    """Функция принимает url API метода, р/с, дату отчета и два токена, возвращает список из словарей по выпискам"""
    URL_API = 'https://api.openapi.raiffeisen.ru/api'
    headers = {
        'Authorization': access_token,
        'Id-Token': id_token,
        'Accept': 'application/json'}
    params = {'account': bank_acc_num,
              'statementDate': statement_date,
              'fields': ['ContractorInn', 'CreditDocument', 'Debet', 'Credit', 'DocumentNumber', 'Account',
                         'OrganizationName', 'Purpose',
                         'ValuationDate', 'ContractorName', 'DocumentDate', 'OperationDate', 'OperationType',
                         'StatementDate',
                         'StatementType', 'Avisetype', 'ContractorAccount', 'ContractorBankName', 'ContractorBankBic',
                         'AccountCurrency', 'Uip', 'RubPaymentId', 'Spc', 'Personalkpp', 'Corrkpp', 'Gvc'],
              'limit': 10000,
              'offset': 0,
              'Id-Token': id_token}

    result = requests.get(URL_API + url_method, params=params, headers=headers)
    for key, value in result.__dict__.items():
        if key == '_content':
            text_decoded = value.decode('utf-8')
            with open('resp.json', mode='w', encoding='utf-8') as f:
                f.write(text_decoded)
            return json.loads(text_decoded)


date = '2024-07-16'
account_num = 40702810300000116486
method_API = f'/v1/statement/transactions'
Access_Token, Id_Token = get_tokens_in_postgre(_parameters)
Access_Token = "Bearer " + Access_Token
response = print(get_statement_transaction(method_API, account_num, date, Id_Token, Access_Token))
