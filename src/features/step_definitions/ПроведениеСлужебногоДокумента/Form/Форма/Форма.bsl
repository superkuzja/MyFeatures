﻿
#Область Служебные_функции_и_процедуры

&НаКлиенте
// контекст фреймворка Vanessa-ADD
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-ADD.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	// описание шагов
	// пример вызова Ванесса.ДобавитьШагВМассивТестов(ВсеТесты, Снипет, ИмяПроцедуры, ПредставлениеТеста, ОписаниеШага, ТипШагаДляОписания, ТипШагаВДереве);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯСоздаюНовыйСлужебныйДокумент()","ЯСоздаюНовыйСлужебныйДокумент","Допустим я создаю новый служебный документ","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗаполняюДокументСлужебныйДокументТестовымиЗначениями()","ЯЗаполняюДокументСлужебныйДокументТестовымиЗначениями","И я заполняю документ служебный документ тестовыми значениями","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПровожуДокумент()","ЯПровожуДокумент","Когда я провожу документ","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДокументПроведен()","ДокументПроведен","Тогда документ проведен","","");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции

#КонецОбласти



#Область Работа_со_сценариями

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры

#КонецОбласти


///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Допустим я создаю новый служебный документ
//@ЯСоздаюНовыйСлужебныйДокумент()
Процедура ЯСоздаюНовыйСлужебныйДокумент() Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	СлужебныйДокумент = ПолучитьНовыйСлужебныйДокумент();
	Контекст.Вставить("СлужебныйДокумент", СлужебныйДокумент);
КонецПроцедуры

&НаКлиенте
//И я заполняю документ служебный документ тестовыми значениями
//@ЯЗаполняюДокументСлужебныйДокументТестовымиЗначениями()
Процедура ЯЗаполняюДокументСлужебныйДокументТестовымиЗначениями() Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	СлужебныйДокумент = Контекст.СлужебныйДокумент;
	ЗаполнитьРеквизитыСлужебногоДокумента(СлужебныйДокумент);
КонецПроцедуры

&НаКлиенте
//Когда я провожу документ
//@ЯПровожуДокумент()
Процедура ЯПровожуДокумент() Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	СлужебныйДокумент = Контекст.СлужебныйДокумент;
	ПровестиДокумент(СлужебныйДокумент);
КонецПроцедуры

&НаКлиенте
//Тогда документ проведен
//@ДокументПроведен()
Процедура ДокументПроведен() Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);

	СлужебныйДокумент = Контекст.СлужебныйДокумент;
	Если НЕ ДокументПроведенПроверка(СлужебныйДокумент) Тогда
		ВызватьИсключение "Документ не проведен!";
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Функция ПолучитьНовыйСлужебныйДокумент()
	
	Док = Документы.СлужебныйДокумент.СоздатьДокумент();
	Док.Дата = ТекущаяДата();
	Док.Записать(РежимЗаписиДокумента.Запись);
	
	Возврат Док.Ссылка;
	
КонецФункции

&НаСервере
Процедура ЗаполнитьРеквизитыСлужебногоДокумента(СлужебныйДокумент)
	
	ДокОбъект = СлужебныйДокумент.ПолучитьОбъект();
	
	#Если Клиент И Не Клиент Тогда
	ДокОбъект = Документы.СлужебныйДокумент.СоздатьДокумент();
	#КонецЕсли
	
	ДокОбъект.Реквизит1 = "ЗначениеРеквизита1";
	ДокОбъект.Реквизит2 = "ЗначениеРеквизита2";
	ДокОбъект.Записать(РежимЗаписиДокумента.Запись);
	
КонецПроцедуры

&НаСервере
Процедура ПровестиДокумент(СлужебныйДокумент)
	
	ДокОбъект = СлужебныйДокумент.ПолучитьОбъект();
	
	#Если Клиент И Не Клиент Тогда
	ДокОбъект = Документы.СлужебныйДокумент.СоздатьДокумент();
	#КонецЕсли

	ДокОбъект.Записать(РежимЗаписиДокумента.Проведение);
	
КонецПроцедуры

&НаСервере
Функция ДокументПроведенПроверка(СлужебныйДокумент)
	
	#Если Клиент И Не Клиент Тогда
	СлужебныйДокумент = Документы.СлужебныйДокумент.ПустаяСсылка();
	#КонецЕсли

	Возврат СлужебныйДокумент.Проведен;
	
КонецФункции
