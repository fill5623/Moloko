﻿Функция РозничнаяЦена(АктуальнаяДата, ЭлементНоменклатуры) Экспорт
Отбор = Новый Структура("Номенклатура", ЭлементНоменклатуры);
ЗначениеРесурсов = РегистрыСведений.Цены.ПолучитьПоследнее(АктуальнаяДата, Отбор);
Возврат ЗначениеРесурсов.Цена;
КонецФункции
