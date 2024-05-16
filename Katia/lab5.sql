alter table Klient add column data_urodzenia date;

alter table Klient drop column telefon;

update Zamowienie set koszt_wysylki = 0.00 where data_wysylki is null;

update Towar set koszt = koszt * 1.1;

update Klient set nazwisko = 'Maszke' where nazwisko = 'Songin';

update Klient set ulica_dom = 'Nowa 10', kod_pocztowy = '80-000', miasto = 'Gdańsk' where nr = 15;

update Zapas set ilosc = 0 where towar_nr in (1, 2, 3);

delete from Zapas where ilosc = 0;

delete from Klient where nr = 10;

delete from Kod_kreskowy where towar_nr is null;

alter table Zapas rename column ilosc to liczba;

alter table Kod_kreskowy drop constraint Kod_kreskowy_ibfk_1;
alter table Kod_kreskowy add constraint foreign key (towar_nr) references Towar(nr) on delete cascade;
alter table Pozycja drop constraint Pozycja_ibfk_2;
alter table Pozycja add constraint foreign key (towar_nr) references Towar(nr) on delete cascade;
delete from Towar where cena < 5;