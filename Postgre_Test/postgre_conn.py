import psycopg2

params = dict(host='t-bankapi-01.hq.ru.corp.leroymerlin.com', port=6435, database='bankapiconnector',
              user='bankapiconnector', password='ZPLuQzrV8JBJa4Hv')
with psycopg2.connect(**params) as conn:
    cur = conn.cursor()
    cur.execute('''SELECT * FROM public.bank_statements_transaction
                    WHERE statement_date = current_date ''')
    result = cur.fetchall()

for x in result:
    print(x)
