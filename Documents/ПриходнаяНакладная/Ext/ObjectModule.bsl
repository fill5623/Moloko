﻿Процедура ОбработкаПроведения(Отказ, Режим)
		Движения.ОстаткиПродукции.Записывать = Истина;
		Движения.СтоимостьПродукции.Записывать = Истина;
	Для Каждого ТекСтрокаПродукции Из ПереченьНоменклатуры Цикл
		Движение = Движения.ОстаткиПродукции.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Продукция = ТекСтрокаПродукции.Номенклатура;
		Движение.Склад = Склад;
		Движение.Количество = ТекСтрокаПродукции.Количество;
		
				
		Движение = Движения.СтоимостьПродукции.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Продукция = ТекСтрокаПродукции.Номенклатура;
		Движение.Стоимость = ТекСтрокаПродукции.Сумма;
		
	КонецЦикла;
                                        
КонецПроцедуры
