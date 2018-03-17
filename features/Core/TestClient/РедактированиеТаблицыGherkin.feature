﻿# language: ru

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOnWeb

@tree


Функционал: Редактирование таблицы Gherkin

	Как Разработчик я хочу
	Чтобы у меня был функционал для редактирования таблицы Gherkin
	Для того чтобы я мог быстрее редактировать и создавать шаги



Контекст:
	Когда я запускаю служебный сеанс TestClient с ключом TestManager в той же базе
	
	
	
Сценарий: Редактирование таблицы Gherkin
	Дано    Я закрыл все окна клиентского приложения
	
	Когда Я открываю VanessaBehavior в режиме TestClient со стандартной библиотекой
	И я загружаю служебную фичу и устанавливаю настройки
			И В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ФичаДляПроверкиРедактораТаблицыGherkin"
			И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-Behavior TestClient

	Затем я записываю действия пользователя чтобы там была таблица
#			И     я нажимаю на кнопку "Начать запись поведения"
			И Я нажимаю на кнопку выполнить сценарии в Vanessa-Behavior TestClient
			И у элемента "Сценарии выполнены" я жду значения "Да" в течение 20 секунд
			И     элемент формы с именем "Статистика" стал равен '1/1/19, 19/0/0'
#			И     я нажимаю на кнопку "Закончить запись поведения"
			И Пауза 1
			И     я нажимаю на кнопку "Получить состояние всей формы"
			И Пауза 1
	Затем я вызываю редактор таблицы
			И     в поле "Произвольный код" я ввожу текст
				| МассивСтрок =  РазложитьСтрокуВМассивПодстрокКлиент(Объект.СгенерированныйСценарий, Символы.ПС);  |
				| НомерСтроки = 0;                                                                          |
				| Для Каждого Стр Из МассивСтрок Цикл                                                         |
				|  НомерСтроки = НомерСтроки + 1;                                                            |
				| //  Сообщить(Стр);                                                                        |
				| Если Лев(СокрЛП(Стр),1) = "\|" Тогда                                                       |
				|    Элементы.СгенерированныйСценарий.УстановитьГраницыВыделения(НомерСтроки,1,НомерСтроки,1);     |
				|    Прервать;                                                                             |
				|  КонецЕсли;                                                                              |
				| КонецЦикла;                                                                              |
			
			И     я нажимаю на кнопку "Выполнить произвольный код"

			
	И я редактирую таблицу Gherkin
			И     у поля "СгенерированныйСценарий" я выбираю пункт контекстного меню "Редактировать таблицу"
			И     в ТЧ "СписокКолонок" я нажимаю на кнопку "Снять все"
			И     В форме "Vanessa Behavior" в таблице "СписокКолонок" я перехожу к строке:
				| 'Значение'       |
				| 'N'              |
			И     в ТЧ "СписокКолонок" я устанавливаю флаг "Пометка"
			
			И     я нажимаю на кнопку "ОК"
			#откроем ещё раз редактор таблиц
			И     я нажимаю на кнопку "Выполнить произвольный код"			
			И     у поля "СгенерированныйСценарий" я выбираю пункт контекстного меню "Редактировать таблицу"
			
				
			
	Тогда в тексте значение таблицы стало правильным
			И     таблица формы с именем "СписокКолонок" стала равной:
				| 'Пометка' | 'Значение' |
				| 'Да'      | 'N'        |
				
			И     я нажимаю на кнопку "ОК"

				
Сценарий: Закрыть TestClient, который был открыт из второго TestManager
	Дано Я закрыл все окна клиентского приложения кроме "*Vanessa Behavior"
	И я загружаю служебную фичу и устанавливаю настройки
			И В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ЗакрытьПодключенныйTestClient"
			И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-Behavior TestClient
			И Я нажимаю на кнопку выполнить сценарии в Vanessa-Behavior TestClient
			И у элемента "Сценарии выполнены" я жду значения "Да" в течение 20 секунд
	И я закрываю TestClient "TM"