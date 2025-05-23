// @strict-types
#Область ПрограммныйИнтерфейс

// См. КодыВозвратаСерверГлобальный.КодВозвратаУспех
// 
// Параметры:
//  КодВозврата - Число
// 
// Возвращаемое значение:
//  Булево
Функция ЭтоКодВозвратаУспех(КодВозврата) Экспорт

    Возврат КодВозврата = 0;

КонецФункции

#Область КонтрольОтбора

// См. КодыВозвратаСерверГлобальный.КодВозвратаНеНайденоЗаданиеНаОтборПоШтрихкоду
// 
// Параметры:
//  КодВозврата - Число
// 
// Возвращаемое значение:
//  Булево
Функция ЭтоКодВозвратаНеНайденоЗаданиеНаОтборПоШтрихкоду(КодВозврата) Экспорт

    Возврат КодВозврата = 1000;

КонецФункции

// См. КодыВозвратаСерверГлобальный.КодВозвратаСлишкомМногоВКоробе
// 
// Параметры:
//  КодВозврата - Число
// 
// Возвращаемое значение:
//  Булево
Функция ЭтоКодВозвратаСлишкомМногоВКоробе(КодВозврата) Экспорт

    Возврат КодВозврата = 1001;

КонецФункции

// См. КодыВозвратаСерверГлобальный.КодВозвратаОтсутствуетДокументНаВнутреннееПеремещение
// 
// Параметры:
//  КодВозврата - Число
// 
// Возвращаемое значение:
//  Булево
Функция ЭтоКодВозвратаОтсутствуетДокументНаВнутреннееПеремещение(КодВозврата) Экспорт

    Возврат КодВозврата = 1002;

КонецФункции

// См. КодыВозвратаСерверГлобальный.КодВозвратаШтрихкодУжеПроведен
// 
// Параметры:
//  КодВозврата - Число
// 
// Возвращаемое значение:
//  Булево
Функция ЭтоКодВозвратаШтрихкодУжеПроведен(КодВозврата) Экспорт

    Возврат КодВозврата = 1003;

КонецФункции

// См. КодыВозвратаСерверГлобальный.КодВозвратаШтрихкодУжеПроведенДругим
// 
// Параметры:
//  КодВозврата - Число
// 
// Возвращаемое значение:
//  Булево
Функция ЭтоКодВозвратаШтрихкодУжеПроведенДругим(КодВозврата) Экспорт

    Возврат КодВозврата = 1004;

КонецФункции

// См. КодыВозвратаСерверГлобальный.КодВозвратаОшибкаПроверкиПроведенияШтрихкода
// 
// Параметры:
//  КодВозврата - Число
// 
// Возвращаемое значение:
//  Булево
Функция ЭтоКодВозвратаОшибкаПроверкиПроведенияШтрихкода(КодВозврата) Экспорт

    Возврат КодВозврата = 1005;

КонецФункции

#КонецОбласти

#Область ИнвентаризацияОбуви

// См. КодыВозвратаСерверГлобальный.КодВозвратаШтрихкодУжеОтсканирован
// 
// Параметры:
//  КодВозврата - Число
// 
// Возвращаемое значение:
//  Булево
Функция ЭтоКодВозвратаШтрихкодУжеОтсканирован(КодВозврата) Экспорт

    Возврат КодВозврата = 2000;

КонецФункции

// См. КодыВозвратаСерверГлобальный.КодВозвратаШтрихкодУжеОтсканированДругим
// 
// Параметры:
//  КодВозврата - Число
// 
// Возвращаемое значение:
//  Булево
Функция ЭтоКодВозвратаШтрихкодУжеОтсканированДругим(КодВозврата) Экспорт

    Возврат КодВозврата = 2001;

КонецФункции

#КонецОбласти

#Область МаркировкаИПрослеживаемость

// См. КодыВозвратаСерверГлобальный.КодВозвратаТоварНайден
// 
// Параметры:
//  КодВозврата - Число
// 
// Возвращаемое значение:
//  Булево
Функция ЭтоКодВозвратаТоварНайден(КодВозврата) Экспорт

    Возврат КодВозврата = 3000;

КонецФункции

// См. КодыВозвратаСерверГлобальный.КодВозвратаНеНайденаНоменклатура
// 
// Параметры:
//  КодВозврата - Число
// 
// Возвращаемое значение:
//  Булево
Функция ЭтоКодВозвратаНеНайденаНоменклатура(КодВозврата) Экспорт

    Возврат КодВозврата = 3001;

КонецФункции

// См. КодыВозвратаСерверГлобальный.КодВозвратаНовыйШтрихкод
// 
// Параметры:
//  КодВозврата - Число
// 
// Возвращаемое значение:
//  Булево
Функция ЭтоКодВозвратаНовыйШтрихкод(КодВозврата) Экспорт

    Возврат КодВозврата = 3002;

КонецФункции

// См. КодыВозвратаСерверГлобальный.КодВозвратаНеНайденКодМаркировки
// 
// Параметры:
//  КодВозврата - Число
// 
// Возвращаемое значение:
//  Булево
Функция ЭтоКодВозвратаНеНайденКодМаркировки(КодВозврата) Экспорт

    Возврат КодВозврата = 3003;

КонецФункции

// См. КодыВозвратаСерверГлобальный.КодВозвратаКодМаркировкиУжеПроверен
// 
// Параметры:
//  КодВозврата - Число
// 
// Возвращаемое значение:
//  Булево
Функция ЭтоКодВозвратаКодМаркировкиУжеПроверен(КодВозврата) Экспорт

    Возврат КодВозврата = 3004;

КонецФункции

#КонецОбласти

#КонецОбласти