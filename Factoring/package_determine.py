path_to = 'C:\\Users\\60227416\\OneDrive - leroymerlin.ru\\Рабочий стол\\1\\'
file_name = 'Райфф 22.07.txt'

with open(path_to + file_name, 'r', encoding='utf-8') as file:
    f = file.readlines()
package_list = []
count = 0
search_string = 'pkg_id = '
for line in f:
    if 'Пакет по поставщику' in line:
        count += 1

        package_list.append(line[line.find(search_string) + len(search_string):-1])
package_list.sort()

package_list = tuple(map(int, package_list))
print('Кол-во пакетов', len(package_list))
print('Пакеты:', package_list, sep='\n')

search_start_time = '**Starts**'
search_end_time = '**Ends**'

import datetime

for line in f:
    if search_start_time in line or search_end_time in line:
        if search_start_time in line:
            start_time_str = line.lstrip(search_start_time).rstrip('\n')
            start_time_datetime = datetime.datetime.strptime(start_time_str, '%d-%m-%Y %H:%M:%S')
        elif search_end_time in line:
            end_time_str = line.lstrip(search_end_time).rstrip('\n')
            end_time_datetime = datetime.datetime.strptime(end_time_str, '%d-%m-%Y %H:%M:%S')

print('Дата и время начала загрузки', start_time_str)
print('Дата и время завершения загрузки', end_time_str)

time_spent = end_time_datetime - start_time_datetime
print('Время затрачено на загрузку', time_spent)
print('Средняя загрузка 1 пакета', time_spent.total_seconds() / 60 / len(package_list))