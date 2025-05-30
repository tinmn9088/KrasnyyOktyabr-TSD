// @strict-types
#Область ПрограммныйИнтерфейс

// Функция определяет существует ли номенклатура с данным штрихкодом и либо добавляет товар
// в реализацию товаров, либо увеличивает счетчик количества.
// 
// Параметры:
//  РеализацияТоваров - ДокументСсылка.РеализацияТоваров
//  ШтрихкодТовара - Строка
// 
// Возвращаемое значение:
//  См. НовоеОписаниеОбработкиШтрихкода
Функция ОбработатьШтрихкодТовара(Знач РеализацияТоваров, Знач ШтрихкодТовара) Экспорт

    НачатьТранзакцию();

    Попытка

        ОписаниеОбработкиШтрихкода = НовоеОписаниеОбработкиШтрихкода();
        
        // 1. Поиск номенклатуры по штрихкоду 
        Запрос = Новый Запрос("ВЫБРАТЬ ПЕРВЫЕ 1
                              |    ВсеШтрихкодыНоменклатуры.Ссылка КАК Номенклатура
                              |ИЗ
                              |    Справочник.НоменклатураРозница.Штрихкоды КАК ВсеШтрихкодыНоменклатуры
                              |ГДЕ
                              |    ВсеШтрихкодыНоменклатуры.Штрихкод = &Штрихкод");

        Запрос.УстановитьПараметр("Штрихкод", ШтрихкодТовара);
        РезультатЗапроса = Запрос.Выполнить();
        Выборка = РезультатЗапроса.Выбрать();

        Если Не Выборка.Следующий() Тогда

            ОтменитьТранзакцию();

            ОписаниеОбработкиШтрихкода.КодВозврата = КодВозвратаНовыйШтрихкод();

            Возврат ОписаниеОбработкиШтрихкода;

        КонецЕсли;

        //@skip-check property-return-type
        НоменклатураТовара = Выборка.Номенклатура; // СправочникСсылка.НоменклатураРозница
        
        // 2. Увеличение количества товара или добавление нового товара
        Если ШтрихкодЕстьВРеализации(РеализацияТоваров, ШтрихкодТовара) Тогда

            НовоеКоличество = УвеличитьКоличествоТовара(РеализацияТоваров, ШтрихкодТовара, НоменклатураТовара);
            ОписаниеОбработкиШтрихкода.НовоеКоличество = НовоеКоличество;
            ОписаниеОбработкиШтрихкода.ПредыдущееКоличество = НовоеКоличество - 1;

        Иначе

            ДобавитьТоварВРеализацию(РеализацияТоваров, ШтрихкодТовара, НоменклатураТовара);
            ОписаниеОбработкиШтрихкода.НовоеКоличество = 1;
            ОписаниеОбработкиШтрихкода.ПредыдущееКоличество = 0;

        КонецЕсли;

        ОписаниеОбработкиШтрихкода.КодВозврата = КодВозвратаТоварНайден();

        ЗафиксироватьТранзакцию();

        Возврат ОписаниеОбработкиШтрихкода;

    Исключение

        ОтменитьТранзакцию();
        ВызватьИсключение;

    КонецПопытки;

КонецФункции

// Функция добавляет штрихкод без номенклатуры в реализацию товаров.
// 
// Параметры:
//  РеализацияТоваров - ДокументСсылка.РеализацияТоваров
//  ШтрихкодБезНоменклатуры - Строка
// 
// Возвращаемое значение:
//  См. НовоеОписаниеОбработкиШтрихкода
Функция ОбработатьШтрихкодБезНоменклатуры(Знач РеализацияТоваров, Знач ШтрихкодБезНоменклатуры) Экспорт

    ОписаниеОбработкиШтрихкода = НовоеОписаниеОбработкиШтрихкода();

    РегистрыСведений.ШтрихкодыТоваров.ДобавитьШтрихкод(РеализацияТоваров, ШтрихкодБезНоменклатуры);

    ОписаниеОбработкиШтрихкода.КодВозврата = КодВозвратаУспех();

    Возврат ОписаниеОбработкиШтрихкода;

КонецФункции

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

// Функция создает описание обработки штрихкода.
// 
// Возвращаемое значение:
//  Структура - Описание обработки штрихкода:
// * КодВозврата - Число - Код, указывающий на результат обработки штрихкода
// * ПредыдущееКоличество - Неопределено, Число - Значение реквизита "Количество" до обработки штрихкода
// * НовоеКоличество - Неопределено, Число - Значение реквизита "Количество" после обработки штрихкода
Функция НовоеОписаниеОбработкиШтрихкода() Экспорт

    ОписаниеОбработкиШтрихкода = Новый Структура;

    ОписаниеОбработкиШтрихкода.Вставить("КодВозврата", КодВозвратаУспех());
    ОписаниеОбработкиШтрихкода.Вставить("ПредыдущееКоличество", Неопределено);
    ОписаниеОбработкиШтрихкода.Вставить("НовоеКоличество", Неопределено);

    Возврат ОписаниеОбработкиШтрихкода;

КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// См. РегистрСведенийМенеджер.ШтрихкодыТоваров.ЕстьШтрихкод
Функция ШтрихкодЕстьВРеализации(Знач Документ, Знач Штрихкод)

    Возврат РегистрыСведений.ШтрихкодыТоваров.ЕстьШтрихкод(Документ, Штрихкод);

КонецФункции

// См. РегистрСведенийМенеджер.ШтрихкодыТоваров.ДобавитьШтрихкод
Процедура ДобавитьТоварВРеализацию(Знач Документ, Знач Штрихкод, Знач Номенклатура)

    РегистрыСведений.ШтрихкодыТоваров.ДобавитьШтрихкод(Документ, Штрихкод, Номенклатура);

КонецПроцедуры

// См. РегистрСведенийМенеджер.ШтрихкодыТоваров.УвеличитьКоличество
Функция УвеличитьКоличествоТовара(Знач Документ, Знач Штрихкод, Знач Номенклатура)

    Возврат РегистрыСведений.ШтрихкодыТоваров.УвеличитьКоличество(Документ, Штрихкод, Номенклатура);

КонецФункции

#КонецОбласти