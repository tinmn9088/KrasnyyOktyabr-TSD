#Область ПрограммныйИнтерфейс

// Процедура сохраняет сотрудника, заполнившего документ, и помечает
// документ на удаление.
// 
// Параметры:
//  Сотрудник - СправочникСсылка.СотрудникиСклада
Процедура ЗавершитьВыполнение(Знач Сотрудник) Экспорт

    СотрудникВыполнившийПересчет = Сотрудник;
    Записать();

    УстановитьПометкуУдаления(Истина);

КонецПроцедуры

#КонецОбласти