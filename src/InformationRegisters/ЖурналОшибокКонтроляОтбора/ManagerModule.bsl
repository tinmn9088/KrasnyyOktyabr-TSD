// @strict-types
#Область ПрограммныйИнтерфейс

// Процедура записывает информацию об ошибке.
// 
// Параметры:
//  Документ - ДокументСсылка.Задание
//  Комплектовщик - СправочникСсылка.Комплектовщики
//  ВидОшибки - ПеречислениеСсылка.ВидОшибкиКонтроляОтбора
//  НомерЗаданияНаОтбор - Неопределено, Число - Номер задания на отбор
//  Штрихкод - Строка
Процедура ЗаписатьОшибку(Знач Документ, Знач Комплектовщик, Знач ВидОшибки, Знач НомерЗаданияНаОтбор, Знач Штрихкод) Экспорт

    // Удаление специальных символов кода маркировки, которые могут поломать регистр сведений
    ШтрихкодыКлиентСервер.Сериализовать(Штрихкод);

    Запись = СоздатьМенеджерЗаписи();

    Запись.Идентфикатор = Новый УникальныйИдентификатор;
    Запись.Дата = ТекущаяДатаСеанса();
    Запись.Документ = Документ;
    Запись.Комплектовщик = Комплектовщик;
    Запись.ВидОшибки = ВидОшибки;
    Запись.НомерЗаданияНаОтбор = НомерЗаданияНаОтбор;
    Запись.ТипШтрихкода = ШтрихкодыОбувиКлиентСервер.ТипШтрихкода(Штрихкод);
    Запись.Штрихкод = Штрихкод;

    Запись.Записать();

КонецПроцедуры

#КонецОбласти