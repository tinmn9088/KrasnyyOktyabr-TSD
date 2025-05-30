// @strict-types
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)

    ФормаСотрудник = Параметры.Сотрудник;

КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)

#Если МобильныйКлиент Или МобильноеПриложениеКлиент Тогда
    
    // Отключение видимости шапки динамического списка, чтобы сэкономить место на экране 
    Элементы.СписокПоступленийТоваров.Шапка = Ложь;

#КонецЕсли

КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыСписокПоступленийТоваров

// Процедура открывает форму для заполнения поступления товаров.
// 
// Параметры:
//  Элемент - ТаблицаФормы - Элемент
//  Значение - ДокументСсылка.ПоступлениеТоваров - Значение
//  СтандартнаяОбработка - Булево - Стандартная обработка
&НаКлиенте
Процедура СписокПоступленийТоваровВыборЗначения(Элемент, Значение, СтандартнаяОбработка)

    СтандартнаяОбработка = Ложь;

    ПараметрыФормы = Новый Структура;
    ПараметрыФормы.Вставить("Документ", Значение);
    ПараметрыФормы.Вставить("Сотрудник", ФормаСотрудник);

    ОткрытьФорму("Документ.ПоступлениеТоваров.Форма.ФормаЗаполнения", ПараметрыФормы);

    Закрыть();

КонецПроцедуры

#КонецОбласти