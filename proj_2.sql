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

insert into kurzInstruktorVazebniTabulka(idKurzu, idInstruktora) values(0, 0);
insert into kurzInstruktorVazebniTabulka(idKurzu, idInstruktora) values(0, 1);
insert into kurzInstruktorVazebniTabulka(idKurzu, idInstruktora) values(1, 0);
insert into kurzInstruktorVazebniTabulka(idKurzu, idInstruktora) values(1, 1);
insert into kurzInstruktorVazebniTabulka(idKurzu, idInstruktora) values(2, 2);
insert into kurzInstruktorVazebniTabulka(idKurzu, idInstruktora) values(3, 1);
insert into kurzInstruktorVazebniTabulka(idKurzu, idInstruktora) values(3, 2);

insert into klient(rodneCislo, jmeno, prijmeni, email, adresa) values(8606236529, 'Jaroslav', 'Pospisil', 'jardapospisil@gmail.com', 'Brno, Falesneho 123');
insert into klient(rodneCislo, jmeno, prijmeni, email, adresa) values(0209020119, 'Monika', 'Moudra', 'mmoudra@gmail.com', Null);
insert into klient(rodneCislo, jmeno, prijmeni, email, adresa) values(9909285001, 'Klara', 'Vystrcilova', 'klaravystrcilova12@gmail.com', Null);
insert into klient(rodneCislo, jmeno, prijmeni, email, adresa) values(9353029411, 'Adam', 'Rozvratil', 'masinaadam99@gmail.com', Null);
insert into klient(rodneCislo, jmeno, prijmeni, email, adresa) values(9955180554, 'Viktorie', 'Brzobohata', 'victorybohata@gmail.com', Null);

insert into skupinLekce(idLekce, cena, obtiznost, popis, delkaTrvani, denKonani, casKonani, pocetLekci, pocetVolnychMist, idInstruktora, idKurzu, idMistnosti) values(0, 2500, 6, 'Lekce pro pokrocile', 60, 'utery', '15:30', 10, 5, 1, 0, 103);
insert into skupinLekce(idLekce, cena, obtiznost, popis, delkaTrvani, denKonani, casKonani, pocetLekci, pocetVolnychMist, idInstruktora, idKurzu, idMistnosti) values(1, 1500, 1, 'Lekce pro zacatecniky', 30, 'utery', '13:30', 7, 15, 1, 0, 103);
insert into skupinLekce(idLekce, cena, obtiznost, popis, delkaTrvani, denKonani, casKonani, pocetLekci, pocetVolnychMist, idInstruktora, idKurzu, idMistnosti) values(2, 2000, 3, Null, 120, 'patek', '17:00', 15, 4, 0, 1, 301);

insert into skupinLekceKlientVazebniTabulka(idLekce, rodneCislo) values(0, 0209020119);
insert into skupinLekceKlientVazebniTabulka(idLekce, rodneCislo) values(2, 0209020119);
insert into skupinLekceKlientVazebniTabulka(idLekce, rodneCislo) values(1, 8606236529);
insert into skupinLekceKlientVazebniTabulka(idLekce, rodneCislo) values(1, 9955180554);
insert into skupinLekceKlientVazebniTabulka(idLekce, rodneCislo) values(1, 9909285001);

insert into individLekce(idLekce, cena, obtiznost, popis, delkaTrvani, denKonani, casKonani, pocetLekci, idInstruktora, idKurzu, idMistnosti, rcKlienta) values(0, 6000, 5, 'Bojove umeni', 90, 'streda', '18:15', 20, 2, 2, 201, 9353029411);
insert into individLekce(idLekce, cena, obtiznost, popis, delkaTrvani, denKonani, casKonani, pocetLekci, idInstruktora, idKurzu, idMistnosti, rcKlienta) values(1, 5500, 5, 'Bojove umeni', 90, 'ctvrtek', '18:15', 20, 2, 3, 201, 9955180554);

insert into clenskaKarta(idKarty, rcMajitele) values(0, 8606236529);
insert into clenskaKarta(idKarty, rcMajitele) values(1, 0209020119);
insert into clenskaKarta(idKarty, rcMajitele) values(2, 9909285001);
insert into clenskaKarta(idKarty, rcMajitele) values(3, 9353029411);
insert into clenskaKarta(idKarty, rcMajitele) values(4, 9955180554);