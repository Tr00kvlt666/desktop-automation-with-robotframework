*** Settings ***
Library  RPA.Windows   

#Здесь прописываются переменные
*** Variables ***
${path}    #путь до приложения               


#Здесь прописываются ключевые слова - однотипные сценарии заменяются одной командой
*** Keywords ***                    
Open RNKIN                    #Ключевое слово для открытия программы
    Set Global Timeout    5      
    Windows Run    ${path}    30
    Control Window    regex:Company
Open plugin shop            #открывается с карты магазин приложений
    Click    Главное меню    5
    Click    Магазин приложений    5
Open settings
    Click    Главное меню    5
    Click    Настройки    5
Exit RNKIN
    Click    Главное меню    4
    Click    Выход    30
Open monitoring process
    Open RNKIN                       
    Open plugin shop
    Click    Мониторинг
    Click    Всё    4
    Click    Выбор рабочего процесса    4
    Double Click    Row 1    30
Open well from Navigator
    Control Window    name:"Company" and id:Main and type:WindowControl and class:WindowsForms10.Window.8.app.0.3989a29_r38_ad1  # handle:3802910
    Click    DataTab
    Double Click    name:Navigator.ViewModels.VirtualNodeWrappers.VirtualNodeWithEvents and type:TreeItemControl and path:3|1|1|1|1|1|1|2|2|10    5
    Double Click    name:Navigator.ViewModels.VirtualNodeWrappers.VirtualNodeWithEvents and type:TreeItemControl and path:3|1|1|1|1|1|1|2|2|11   5
    Double Click    name:Navigator.ViewModels.VirtualNodeWrappers.VirtualNodeWithLazyLoadingChildNodes and type:TreeItemControl and path:3|1|1|1|1|2|1|2|2|2    5
    Double Click    name:Navigator.ViewModels.VirtualNodeWrappers.VirtualNodeWithLazyLoadingChildNodes and type:CheckBoxControl and path:3|1|1|1|1|2|1|2|2|2|1    5
    Click    name:Navigator.ViewModels.VirtualNodeWrappers.VirtualNodeWithLazyLoadingChildNodes and type:CheckBoxControl and path:3|1|1|1|1|2|1|2|2|3|1|1|1    5        
Close well selection
    Control Window    name:"Company" and id:Main and type:WindowControl and class:WindowsForms10.Window.8.app.0.3989a29_r38_ad1
    Click    OilfieldTab    5
    Double Click    name:Navigator.ViewModels.VirtualNodeWrappers.VirtualNodeWithLazyLoadingChildNodes and type:TreeItemControl and path:3|1|1|1|1|2|1|2|2|2    5
    Double Click    name:Navigator.ViewModels.VirtualNodeWrappers.VirtualNodeWithLazyLoadingChildNodes and type:CheckBoxControl and path:3|1|1|1|1|2|1|2|2|2|1    5
    Click    name:Navigator.ViewModels.VirtualNodeWrappers.VirtualNodeWithLazyLoadingChildNodes and type:CheckBoxControl and path:3|1|1|1|1|2|1|2|2|3|1|1|1    5       

#Здесь представлены тест-кейсы из Карты тестирования
*** Tasks ***
Проверить запуск программы
    Set Mouse Movement    ${False}        
    Open RNKIN  
    Exit RNKIN
Проверить возможность добавления модуля/плагина в панель быстрого доступа
    Set Mouse Movement    ${True}
    Open RNKIN
    Open plugin shop
    Click    Мониторинг    8
    Click    Всё    30
    Send Keys  desktop   {Esc}
    Click    Static    2
    Click    МЭР
    Set Global Timeout    5
    Exit RNKIN    
Проверить загрузку рабочих процессов
    Open RNKIN                    #работает    
    Open plugin shop
    Click    Мониторинг
    Click    Всё    4
    Click    Выбор рабочего процесса    4
    Double Click    Row 1    30         #Двойной клик
    Exit RNKIN
Проверить загрузку кэша
    Open RNKIN                    #работает, но надо закрыть блокнот
    Click    Главное меню    5  
    Click    Локальный кэш    15
    Click    Скачать    40
    Exit RNKIN
    Windows Run    ..\\version.txt    5
    Click    Закрыть    30
Проверить наличие вкладки "Разработчки"
    Open RNKIN                    #работает
    Open settings
    Click    Ядро    5
    Click    Режим разработчика    1
    Click    Консоль разработчика    5
    Click    Выход    30
Проверить выбор темы оформления 
    Open RNKIN                    #работает, но надо следить, нужно создать костыли
    Open settings
    Click    Ядро    5
    Click    Светлая тема    5
    Click    Тёмная тема    3
    Click    Тёмная тема    5
    Click    Светлая тема    5
    Set Global Timeout    10
    Click    Выход
Проверить возможность выбора настроек сервера приложений
    Open RNKIN                    #работает
    Open settings
    Click    Ядро    5
    Click    Режим разработчика    5
    Click    Сервер приложений    5
    Click    Company    5
    Click    Company (предрелиз)    5
    Click    Применить    5
    Click    Перезапуск    40
    Click    Главное меню    5
    Click    Настройки    5
    Click    Сервер приложений    5
    Click    Company (предрелиз)    5
    Click    Company    5
    Click    Применить    5
    Click    Настройки    5
    Click    Ядро    5
    Click    Режим разработчика    5
    Click    Выход
Проверить настройки аутентификации
    Open RNKIN                    #не работает нормально, нет имени у имени пользователя
    Open settings
    Click    Сервер приложений    5
    Click    Применить    5
    Click    Магазин приложений    5
    Click    Выход    30
Проверить открытие плагина
    Open RNKIN
    Open well from Navigator
    Click    Static    5
    Click    Суточные    15
    Click    name:Cкважина and type:HeaderControl and path:1|2|1|1|1|1|1|1|2|1    5
    Close well selection
    Open plugin shop
    Click    Мониторинг
    Click    Всё    4
    Click    Выбор рабочего процесса    4
    Double Click    Row 1    30
    Exit RNKIN
Экспорт суточных в Excel
    Open RNKIN                    #не работает
    Open well from Navigator
    Click    Static    5
    Click    Суточные    15
    Click    name:Cкважина and type:HeaderControl and path:1|2|1|1|1|1|1|1|2|1    5
    Click    Экспорт    15
    Click    Адрес: D:\мусор    5
    Send Keys    desktop    name:"D:\мусор"    0.1    15
    Click    Сохранить    10
    Windows Run    D:\\мусор\\Суточные.xlsx    30
    Send Keys    desktop    {ALT}{F4}    0.1    15   
    Close well selection
    Open plugin shop
    Click    Мониторинг
    Click    Всё    4
    Click    Выбор рабочего процесса    4
    Double Click    Row 1    30
    Exit RNKIN
Выбор месторождения
    Open RNKIN
    Open well from Navigator
    Close well selection
    Exit RNKIN
Закрытие, открытие окна "навигатор"
    Open RNKIN
    Click    name:Close and type:ButtonControl and path:3|1|2|1    5
    Open plugin shop
    Click    Мониторинг
    Click    Всё    4
    Click    Выбор рабочего процесса    4
    Double Click    Row 1    30
    Open well from Navigator
    Close well selection
    Exit RNKIN
Вытащить кнопки с Навигатора
    Control Window    Навигатор    5
    @{buttons} =    Get Elements    id:PART_Editor
    Log List    ${buttons}

List attribute
    Control Window    regex:Company
    ${variable}=    List Attributes    Static
    Log List    ${variable}
 