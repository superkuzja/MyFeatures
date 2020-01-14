#language: ru

Функционал: Создание записи РС ЗаявленияВПолицию

Как Администратор
Я хочу создать заявление в полицию
Чтобы зарегистрировать обращение в полицию

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий:Создание заявления в полицию

	Когда В панели разделов я выбираю 'Займы'
	И Я нажимаю кнопку командного интерфейса 'Заявления в полицию'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заявление в полицию (создание) *'
	И я нажимаю кнопку выбора у поля "Контрагент"
	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я перехожу к строке:
		| Дата рождения | Договор                            | Контрагент                         | Подразделение | Состояние договора |
		| 20.10.1979    | Договор №54110002377 от 20.02.2018 | Абдумухтаров Улугбек Абдукахарович | 54-11         | Заключен договор   |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заявление в полицию (создание) *'
	И я нажимаю кнопку выбора у поля "Договор"
	Тогда открылось окно 'Договоры контрагентов'
	И в таблице "Список" я активизирую поле "Контрагент"
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заявление в полицию (создание) *'
	И в поле с именем 'Сумма' я ввожу текст '10 000,00'
	И я перехожу к следующему реквизиту
	И я нажимаю кнопку выбора у поля "Отделение полиции"
	Тогда открылось окно 'Отделения полиции'
	И в таблице "Список" я перехожу к строке:
		| Вид             | Код       | Кому (ФИО)              | Наименование    |
		| Территориальное | 000000002 | Узбеков Узбек Узбекович | МВД Узбекистана |
	И в таблице "Список" я активизирую поле "Наименование"
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заявление в полицию (создание) *'
	И я нажимаю кнопку выбора у поля "Дата письма"
	И в поле 'Дата письма' я ввожу текст '14.01.2020'
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Заявление в полицию (создание) *' в течение 20 секунд
