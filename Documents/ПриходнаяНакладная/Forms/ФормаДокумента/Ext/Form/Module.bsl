
&НаКлиенте
Процедура МатериалыКоличествоПриИзменении(Элемент)
	СтрокаТабличнойЧасти =  Элементы.Материалы.ТекущиеДанные;
	РаботаСДокументами.РасчитатьСумму(СтрокаТабличнойЧасти);
КонецПроцедуры

&НаКлиенте
Процедура МатериалыПриИзменении(Элемент)
	СтрокаТабличнойЧасти = Элементы.Материалы.ТекущиеДанные;
	РаботаСДокументами.РасчитатьСумму(СтрокаТабличнойЧасти);
КонецПроцедуры

&НаКлиенте
Процедура МатериалыСуммаПриИзменении(Элемент)
	СтрокаТабличнойЧасти = Элементы.Материалы.ТекущиеДанные;
	СтрокаТабличнойЧасти.Цена = СтрокаТабличнойЧасти.Сумма / СтрокаТабличнойЧасти.Количество;
КонецПроцедуры



