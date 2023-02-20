﻿
Процедура Печать(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	Макет = Документы.РасходнаяНакладная.ПолучитьМакет("Печать");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	РасходнаяНакладная.Дата,
	|	РасходнаяНакладная.Клиент,
	|	РасходнаяНакладная.Номер,
	|	РасходнаяНакладная.Склад,
	|	РасходнаяНакладная.Сотрудник,
	|	РасходнаяНакладная.ПереченьНоменклатуры.(
	|		НомерСтроки,
	|		Номенклатура,
	|		Количество,
	|		Цена,
	|		Сумма
	|	)
	|ИЗ
	|	Документ.РасходнаяНакладная КАК РасходнаяНакладная
	|ГДЕ
	|	РасходнаяНакладная.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ОбластьПереченьНоменклатурыШапка = Макет.ПолучитьОбласть("ПереченьНоменклатурыШапка");
	ОбластьПереченьНоменклатуры = Макет.ПолучитьОбласть("ПереченьНоменклатуры");
	ОбластьИтог = Макет.ПолучитьОбласть("Всего");
	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;

		ТабДок.Вывести(ОбластьЗаголовок);

		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());

		ТабДок.Вывести(ОбластьПереченьНоменклатурыШапка);
		ВыборкаПереченьНоменклатуры = Выборка.ПереченьНоменклатуры.Выбрать();
		СуммаИтог = 0;
		Пока ВыборкаПереченьНоменклатуры.Следующий() Цикл
			ОбластьПереченьНоменклатуры.Параметры.Заполнить(ВыборкаПереченьНоменклатуры);
			ТабДок.Вывести(ОбластьПереченьНоменклатуры, ВыборкаПереченьНоменклатуры.Уровень());
			СуммаИтог = СуммаИтог + ВыборкаПереченьНоменклатуры.Сумма;
		КонецЦикла;
        ОбластьИтог.Параметры.ВсегоПоДокументу = СуммаИтог;
		ТабДок.Вывести(ОбластьИтог);
		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры
