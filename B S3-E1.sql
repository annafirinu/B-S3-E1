/*1 Estrai tutti i clienti con nome Mario*/
select *
from clienti
where nome='Mario';

/*2 Estrarre il nome e il cognome dei clienti nati nel 1982*/
select nome, cognome
from clienti
where anno_di_nascita=1982;

/*3 Estrarre il numero delle fatture con iva al 20%*/
select count(*) as numero_fatture
from fatture
where iva=20;

/*4 Estrarre i prodotti attivati nel 2017 e che sono in produzione oppure in commercio*/
select *
from prodotti
where extract(year from data_attivazione)=2017 and (in_produzione=true or in_commercio=true);

/*5 Estrarre le fatture con importo inferiore a 1000 e i dati dei clienti ad esse collegate*/
select *
from fatture f, clienti c
where f.id_cliente=c.numero_cliente and f.importo<1000;

/*6 Riportare l'elenco delle fatture(numero, importo, iva e data) con in aggiunta il nome del fornitore*/
select numero_fattura, importo, iva, data_fattura,denominazione
from fatture fa, fornitori fo
where fa.numero_fornitore=fo.numero_fornitore;

/*7 Considerando soltanto le fatture con iva al 20%, estrarre il numero di fatture per ogni anno*/
select extract(year from data_fattura), count (*)
from fatture
where iva=20
group by extract(year from data_fattura);

/*8 Riportare il numero di fatture e la somma dei reletivi importi divisi per anno di fatturazione*/
select extract(year from data_fattura) as anno, count (*) as numero_fatture,sum(importo) as somma_importo
from fatture
group by extract(year from data_fattura) ;

/*9 Estrarre gli anni in cui sono state registrate più di due fatture con tipologia 'A'*/
select extract(year from data_fattura) as anno, count (*) as numero_fatture
from fatture
where tipologia='A'
group by extract(year from data_fattura)
having count(*)>2;

/*10 Estrarre il totale degli importi delle fatture divisi per residenza dei clienti*/
select sum(f.importo) as totale_fatture, c.regione_residenza
from fatture f, clienti c
where f.id_cliente=c.numero_cliente
group by c.regione_residenza;

/*11 Estrarre il numero dei clienti nati nel 1980 che hanno almeno una fattura superiore a 50€*/
select count(*) as numero_clienti
from fatture f, clienti c
where f.id_cliente=c.numero_cliente and c.anno_di_nascita=1980 and importo>50;


