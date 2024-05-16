SELECT distinct imie, nazwisko
FROM Klient
         join Zamowienie on Klient.nr = Zamowienie.klient_nr
WHERE Klient.nr = Zamowienie.klient_nr
ORDER BY nazwisko;

SELECT Zamowienie.nr, Zamowienie.data_zlozenia, Pozycja.ilosc
FROM Zamowienie
         left join Pozycja
                   ON Zamowienie.nr = Pozycja.zamowienie_nr
union all
SELECT Zamowienie.nr, Zamowienie.data_zlozenia, Pozycja.ilosc
FROM Zamowienie
         right join Pozycja
                    ON Zamowienie.nr = Pozycja.zamowienie_nr;

select imie, nazwisko
from Klient
         join Zamowienie on Klient.nr = Zamowienie.klient_nr
group by imie, nazwisko;

select imie, nazwisko
from Klient
where nr not in (select Klient.nr
                 from Klient
                          join Zamowienie on Klient.nr = Zamowienie.klient_nr);

select Towar.opis, Zapas.liczba
from Towar
         left join Zapas on Towar.nr = Zapas.towar_nr;

SELECT DISTINCT CONCAT(a.imie, ' ', a.nazwisko) AS klient1,
                CONCAT(b.imie, ' ', b.nazwisko) AS klient2
FROM Klient a
         JOIN
     Klient b ON a.miasto = b.miasto AND a.nr < b.nr;

select distinct a.opis as towar1, b.opis as towar1
from Towar a
         join Towar b on a.koszt = b.koszt and a.cena = b.cena and a.nr < b.nr;

select distinct opis from Towar join Kod_kreskowy on Towar.nr = Kod_kreskowy.towar_nr;