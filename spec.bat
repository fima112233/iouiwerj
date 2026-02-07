@echo off
REM Отключаем буферизацию для корректного отображения русских символов
chcp 65001 > nul
setlocal enableextensions enabledelayedexpansion

set /p "file_name=Введите имя файла: "
set /p "file_content=Введите содержимое файла: "
set /p "input_date=Введите дату создания (ГГГГ-ММ-ДД): "

REM Создаем файл с содержимым (используем перенаправление)
echo !file_content! > "!file_name!"

REM Устанавливаем дату создания через PowerShell
powershell -Command "(Get-Item '!file_name!').CreationTime = [datetime]'!input_date!'"

echo Файл "!file_name!" успешно создан.
pause