drop table skupinLekceKlientVazebniTabulka;
drop table skupinLekce;
drop table individLekce;
drop table clenskaKarta;
drop table kurzInstruktorVazebniTabulka;
drop table klient;
drop table sal;
drop table kurz;
drop table instruktor;

create table instruktor(
    idInstruktora int primary key,
    jmeno varchar(31) not null,
    prijmeni varchar(31) not null
);

create table kurz(
    idKurzu int primary key,
    nazev varchar(127) not null
);

create table kurzInstruktorVazebniTabulka(
    idkurzInstruktorVT int primary key,
    idKurzu int not null,
    idInstruktora int not null,
    foreign key (idKurzu) references kurz(idKurzu),
    foreign key (idInstruktora) references instruktor(idInstruktora)
);

create table sal(
    cisloMistnosti int primary key ,
    nazev varchar(127) not null,
    umistneni varchar(255),
    kapacita int default 0 not null
);

create table klient (
  rodneCislo number(10) primary key,
  check (length(to_char(rodneCislo,'FM0000000000')) = 10),
  check (mod(substr(to_char(rodneCislo,'FM0000000000'), 1,9) - mod(rodneCislo, 10), 11) = 0),
  jmeno varchar(32) not null,
  prijmeni varchar(32) not null,
  email varchar(32) not null,
  adresa varchar(32)
);

create table clenskaKarta (
  idKarty int primary key,
  rcMajitele number(10) references klient
);

create table individLekce (
  idLekce int primary key,
  cena int,
  obtiznost int not null,
  popis varchar(255),
  delkaTrvani int not null,
  denKonani varchar(15) not null,
  casKonani varchar(15) not null,
  pocetLekci int not null,
  idInstruktora int references instruktor,
  idKurzu int references kurz,
  idMistnosti int references sal,
  rcKlienta number(10) references klient
);

create table skupinLekce (
  idLekce int primary key,
  cena int,
  obtiznost int not null,
  popis varchar(255),
  delkaTrvani int not null,
  denKonani varchar(15) not null,
  casKonani varchar(15) not null,
  pocetLekci int not null,
  pocetVolnychMist int not null,
  idInstruktora int references instruktor,
  idKurzu int references kurz,
  idMistnosti int references sal
);

create table skupinLekceKlientVazebniTabulka(
    idSkupLekceKlientVT int primary key,
    idLekce int not null,
    rodneCislo number(10) not null,
    foreign key (idLekce) references skupinLekce(idLekce),
    foreign key (rodneCislo) references klient(rodneCislo)
);

insert into sal(cisloMistnosti, nazev, umistneni, kapacita) values(101, 'Mala posilovna', Null, 10);
insert into sal(cisloMistnosti, nazev, umistneni, kapacita) values(102, 'Velka posilovna', Null, 25);
insert into sal(cisloMistnosti, nazev, umistneni, kapacita) values(103, 'Telocvicna', Null, 20);
insert into sal(cisloMistnosti, nazev, umistneni, kapacita) values(201, 'Telocvicna bojovych sportu', 'Stara budova', 8);
insert into sal(cisloMistnosti, nazev, umistneni, kapacita) values(301, 'Bazen', 'Aquapark Delfin', 5);

insert into instruktor(idInstruktora, jmeno, prijmeni) values(0, 'Radek', 'Novotny');
insert into instruktor(idInstruktora, jmeno, prijmeni) values(1, 'Adela', 'Rychla');
insert into instruktor(idInstruktora, jmeno, prijmeni) values(2, 'Igor', 'Hnilicka');

insert into kurz(idKurzu, nazev) values(0, 'Kardio');
insert into kurz(idKurzu, nazev) values(1, 'Vytrvalostni plavani');
insert into kurz(idKurzu, nazev) values(2, 'Judo');
insert into kurz(idKurzu, nazev) values(3, 'Karate');

insert into kurzInstruktorVazebniTabulka(idkurzInstruktorVT, idKurzu, idInstruktora) values(0, 0, 0);
insert into kurzInstruktorVazebniTabulka(idkurzInstruktorVT, idKurzu, idInstruktora) values(1, 0, 1);
insert into kurzInstruktorVazebniTabulka(idkurzInstruktorVT,idKurzu, idInstruktora) values(2, 1, 0);
insert into kurzInstruktorVazebniTabulka(idkurzInstruktorVT,idKurzu, idInstruktora) values(3, 1, 1);
insert into kurzInstruktorVazebniTabulka(idkurzInstruktorVT,idKurzu, idInstruktora) values(4, 2, 2);
insert into kurzInstruktorVazebniTabulka(idkurzInstruktorVT,idKurzu, idInstruktora) values(5, 3, 1);
insert into kurzInstruktorVazebniTabulka(idkurzInstruktorVT,idKurzu, idInstruktora) values(6, 3, 2);

insert into klient(rodneCislo, jmeno, prijmeni, email, adresa) values(8606236529, 'Jaroslav', 'Pospisil', 'jardapospisil@gmail.com', 'Brno, Falesneho 123');
insert into klient(rodneCislo, jmeno, prijmeni, email, adresa) values(0209020119, 'Monika', 'Moudra', 'mmoudra@gmail.com', Null);
insert into klient(rodneCislo, jmeno, prijmeni, email, adresa) values(9909285001, 'Klara', 'Vystrcilova', 'klaravystrcilova12@gmail.com', Null);
insert into klient(rodneCislo, jmeno, prijmeni, email, adresa) values(9353029411, 'Adam', 'Rozvratil', 'masinaadam99@gmail.com', Null);
insert into klient(rodneCislo, jmeno, prijmeni, email, adresa) values(9955180554, 'Viktorie', 'Brzobohata', 'victorybohata@gmail.com', Null);

insert into skupinLekce(idLekce, cena, obtiznost, popis, delkaTrvani, denKonani, casKonani, pocetLekci, pocetVolnychMist, idInstruktora, idKurzu, idMistnosti) values(0, 2500, 6, 'Lekce pro pokrocile', 60, 'utery', '15:30', 10, 5, 1, 0, 103);
insert into skupinLekce(idLekce, cena, obtiznost, popis, delkaTrvani, denKonani, casKonani, pocetLekci, pocetVolnychMist, idInstruktora, idKurzu, idMistnosti) values(1, 1500, 1, 'Lekce pro zacatecniky', 30, 'utery', '13:30', 7, 15, 1, 0, 103);
insert into skupinLekce(idLekce, cena, obtiznost, popis, delkaTrvani, denKonani, casKonani, pocetLekci, pocetVolnychMist, idInstruktora, idKurzu, idMistnosti) values(2, 2000, 3, Null, 120, 'patek', '17:00', 15, 4, 0, 1, 301);

insert into skupinLekceKlientVazebniTabulka(idSkupLekceKlientVT, idLekce, rodneCislo) values(0, 0, 0209020119);
insert into skupinLekceKlientVazebniTabulka(idSkupLekceKlientVT, idLekce, rodneCislo) values(1, 2, 0209020119);
insert into skupinLekceKlientVazebniTabulka(idSkupLekceKlientVT, idLekce, rodneCislo) values(2, 1, 8606236529);
insert into skupinLekceKlientVazebniTabulka(idSkupLekceKlientVT, idLekce, rodneCislo) values(3, 1, 9955180554);
insert into skupinLekceKlientVazebniTabulka(idSkupLekceKlientVT, idLekce, rodneCislo) values(4, 1, 9909285001);

insert into individLekce(idLekce, cena, obtiznost, popis, delkaTrvani, denKonani, casKonani, pocetLekci, idInstruktora, idKurzu, idMistnosti, rcKlienta) values(0, 6000, 5, 'Bojove umeni', 90, 'streda', '18:15', 20, 2, 2, 201, 9353029411);
insert into individLekce(idLekce, cena, obtiznost, popis, delkaTrvani, denKonani, casKonani, pocetLekci, idInstruktora, idKurzu, idMistnosti, rcKlienta) values(1, 5500, 5, 'Bojove umeni', 90, 'ctvrtek', '18:15', 20, 2, 3, 201, 9955180554);
insert into individLekce(idLekce, cena, obtiznost, popis, delkaTrvani, denKonani, casKonani, pocetLekci, idInstruktora, idKurzu, idMistnosti, rcKlienta) values(2, 3000, 3, 'Spinning', 60, 'pondeli', '15:15', 10, 1, 0, 103, 8606236529);

insert into clenskaKarta(idKarty, rcMajitele) values(0, 8606236529);
insert into clenskaKarta(idKarty, rcMajitele) values(1, 0209020119);
insert into clenskaKarta(idKarty, rcMajitele) values(2, 9909285001);
insert into clenskaKarta(idKarty, rcMajitele) values(3, 9353029411);
insert into clenskaKarta(idKarty, rcMajitele) values(4, 9955180554);

-- Select nám vrátí jméno a pøíjmení instruktorù, kteøí jsou proškoleni na daný kurz. Využití v aplikaci napøíklad pøi pøidìlení dané hodiny danému instruktoru.
select instruktor.jmeno, instruktor.prijmeni 
from instruktor inner join kurzInstruktorVazebniTabulka VTkurzInstruktor on VTkurzInstruktor.idInstruktora = instruktor.idInstruktora inner join kurz on VTkurzInstruktor.idKurzu = kurz.idKurzu 
where kurz.nazev = 'Karate';

-- Získá ceny za skupinové lekce klienta dle jeho rodného èísla. Využití pøi platbì, aby si mohlo fitness centrum zobrazit, kolik má daná osoba uhradit penìz.
select skupinLekce.cena 
from skupinLekce inner join skupinLekceKlientVazebniTabulka VTSkupLekceKlient on VTSkupLekceKlient.idLekce = skupinLekce.idLekce inner join klient on VTSkupLekceKlient.rodneCislo = klient.rodneCislo 
where klient.rodneCislo = 0209020119;

-- Získá jméno klienta, který navštìvuje individuální lekci dle id lekce. Využití pøi zjištìní, jaký klient má danou idividuální lekci.
select klient.jmeno, klient.prijmeni 
from individLekce inner join klient on individLekce.rcKlienta = klient.rodneCislo 
where individLekce.idLekce = 0;


-- Získá kontaktní email klienta, jenž navštìvuje individuální lekce daného instruktora. Napøíklad pro pøípad kontaktování o zrušení individuálních lekcí na daný týden.
select email from klient where rodneCislo in (select rcKlienta from individLekce where idInstruktora in (select idInstruktora from instruktor where idInstruktora = 2));


--Ziskat instruktory, kteri maji skupinovou lekci v danem salu 
select instruktor.jmeno, instruktor.prijmeni 
from instruktor inner join skupinLekce on skupinLekce.idInstruktora = instruktor.idInstruktora inner join sal on skupinLekce.idMistnosti = sal.cisloMistnosti 
where sal.cisloMistnosti = 103 
group by instruktor.jmeno, instruktor.prijmeni;


--Ziskat cleny kteri chodi jak na individualni lekci tak skupinovou z daneho kurzu
select k.jmeno, k.prijmeni 
from klient k inner join skupinLekceKlientVazebniTabulka VTSlK on VTSlK.rodneCislo = k.rodneCislo inner join skupinLekce on VTSlK.idLekce = skupinLekce.idLekce inner join kurz on kurz.idKurzu = skupinLekce.idKurzu 
where kurz.idkurzu = 0 and EXISTS (
    select individLekce.* from individLekce  inner join kurz on kurz.idKurzu = individLekce.idKurzu 
    where individLekce.rcKlienta  = k.rodneCislo and kurz.nazev = 'Kardio'
);


-- Získá poèet kurzù a celkovou cenu pro jednotlivé klienty. Využití napøíklad jako informaèní výpis pro fitness centrum, kde si mùže zobrazit kolik kurzù klient navštìvuje a kolik za nì zaplatil.
select klient.prijmeni, klient.jmeno, klient.rodneCislo, sum(pocet) pocet_kurzu, sum(cena) celkova_cena 
from klient, (
    select klient.rodneCislo rodneCislo, count(*) pocet, sum(cena) cena 
    from klient inner join skupinLekceKlientVazebniTabulka VTSkupinLekce on VTSkupinLekce.rodneCislo = klient.rodneCislo inner join SkupinLekce on VTSkupinLekce.idLekce = SkupinLekce.idLekce 
    group by klient.rodneCislo 
    union all 
    select klient.rodneCislo rodneCislo, count(*) pocet, sum(cena) cena 
    from klient, individLekce 
    where individLekce.rcKlienta = klient.rodneCislo 
    group by klient.rodneCislo) celkemLekce 
where klient.rodneCislo = celkemLekce.rodneCislo 
group by klient.prijmeni, klient.jmeno, klient.rodneCislo 
order by klient.prijmeni asc;

--Ziska pocet kurzu, ktere vede dany instruktor. Vyuziti: Porovnani aktivity instruktoru
select instruktor.prijmeni, instruktor.jmeno, sum(pocet) pocet_kurzu 
from instruktor, (
    select instruktor.idInstruktora idInstr, count(*) pocet 
    from instruktor, skupinLekce 
    where skupinLekce.idInstruktora = instruktor.idInstruktora 
    group by instruktor.idInstruktora
    union all 
    select instruktor.idInstruktora idInstr, count(*) pocet 
    from instruktor, individLekce 
    where individLekce.idInstruktora = instruktor.idInstruktora 
    group by instruktor.idInstruktora) lekce 
where instruktor.idInstruktora = lekce.idInstr 
group by instruktor.prijmeni, instruktor.jmeno, instruktor.idInstruktora
order by pocet_kurzu desc;
