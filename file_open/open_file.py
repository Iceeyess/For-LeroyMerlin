import os

class FileManagement:

    def __init__(self, file_name, m, encoding='windows-1251'):
        self.file_name, self.mode, self.e_coding = file_name, m, encoding

    def __enter__(self):
        try:
            self.file = open(self.file_name, self.mode, encoding=self.e_coding)
            print(f"Открываю файл...{self.file_name}")
            print(f"Считываю файл...{self.file_name}")
            self.file_context = self.file.readlines()
            print(f"Содержимое файла: {self.file_context}")
            self.file.write(os.defpath)
            return self.file_context
        except FileNotFoundError:
            print(f"Файл не найден")

    def __exit__(self, exc_type, exc_val, exc_tb):
        print(f"Закрываю файл")
        self.file.close()


f = FileManagement('open.txt', 'r+', 'utf-8')
with f as file:
    print(f"Что-то я уже делаю")
