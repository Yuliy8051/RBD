select *
from Klient
order by miasto;

select *
from Towar
order by opis;

select *
from Zamowienie
order by koszt_wysylki;

select *
from Kod_kreskowy
order by kod;

select nazwisko, concat(kod_pocztowy, ', ', miasto, ', ', ulica_dom) as address
from Klient;

select nr, data_zlozenia
from Zamowienie
order by koszt_wysylki;

select nr, opis, concat(round((cena - koszt) / cena * 100), '%') as procentowy_zysk
from Towar
where cena is not null
  and cena != 0
union
select nr, opis, 'towar jest gratis' from Towar where cena = 0
union
select nr, opis, 'niewiadomy procentowy zysk, ponieważ ceny nie została ustawiona' as procentowy_zysk
from Towar
where cena is null
order by nr;

select nr as numer_zamowienia, concat((data_wysylki - data_zlozenia), ' dni') as czas_realizacji
from Zamowienie
where data_wysylki is not null
union
select nr as numer_zamowienia, 'jeszcze nie zostało realizowane' as czas_realizacji
from Zamowienie
where data_wysylki is null
order by numer_zamowienia;