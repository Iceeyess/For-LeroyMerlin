import oracledb



params = dict(host='oxlrd1-scan1.hq.ru.corp.leroymerlin.com', port=1521, user='HL_BCM', password='Hgt56kU4',
              service_name='GSS1RU')

conn = oracledb.connect(**params)
conn.close()

