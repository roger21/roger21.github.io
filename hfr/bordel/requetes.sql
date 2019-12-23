-- comparaison update
-- PAGINER ! -> Télécharger csv -> upd/pXX.csv
select id, pseudal, nbsmileys from p order by id asc


-- suppression des derniers 404
delete from p where id > (select max(id) from p where exists and httpstatus = 200)


-- dates et temps de collecte
select min(date), max(date), max(date) - min(date) from p -- 2019-04-05 19:42:51+02 / 2019-04-12 02:48:34+02 / 6 days 07:05:43
-- (données collectées entre le 5 avril 2019 à 19:42:51 et le 12 avril 2019 à 2:48:34)


-- nombre de comptes
select count(*) from p -- 1163782
select exists, count(*) from p group by exists -- 19627 / 1144155
select exists, httpstatus, count(*) from p group by exists, httpstatus -- 3 / 1144155 / 19624
select id, profileurl, pseudal from p where httpstatus = 200 and not exists -- Désolé, ce pseudo n'existe pas x3


-- les caractères des pseudals
-- pour le tableau
select c.*, p3.pseudal, p3.profileurl from (select lpad(to_hex(ascii(caractère)), 4, '0') unicode, ascii(caractère) order_unicode, encode(convert_to(caractère, 'UTF8'), 'hex') "UTF-8", ('x' || lpad(encode(convert_to(caractère, 'UTF8'), 'hex'), 6, '0'))::bit(24)::integer "order_UTF-8", caractère, rank() over (order by caractère asc, ascii(caractère) asc) order_caractère, "occurence dans les pseudals", count(*) "nombre de pseudals" from (select caractère, count(*) "occurence dans les pseudals" from (select unnest(regexp_matches(pseudal, '(.)', 'g')) caractère from p) a group by caractère) b, p as p2 where strpos(p2.pseudal, b.caractère) > 0 group by caractère, "occurence dans les pseudals") c left outer join p as p3 on strpos(p3.pseudal, c.caractère) > 0 and c."nombre de pseudals" = 1 order by c.order_unicode
-- le soft hyphen de ARA­MIS
select lpad(to_hex(ascii(c)), 4, '0') unicode, encode(convert_to(c, 'UTF8'), 'hex') "UTF-8", c from (select unnest(regexp_matches(pseudal, '(.)', 'g')) c from p where id=2727) a order by unicode
-- pour les data
select count(*) occurence, caractere, lpad(to_hex(ascii(caractere)), 4, '0') unicode from (select unnest(regexp_matches(pseudal, '(.)', 'g')) caractere from p) a group by caractere order by ascii(caractere)


-- les pseudals en double (chez moi)
select id, profileurl, pseudal from p where pseudal in (select pseudal from (select pseudal, count(*) count from p group by pseudal) a where count > 1) order by pseudal -- 4 (2 x 2) / Muad'Dib / t'steur
select id, profileurl, pseudal from p where pseudal ilike '%''%' -- 4684


-- la longueur des pseudals
select b.*, d.pseudal, d.profileurl from (select char_length(pseudal) longueur, count(*) "nombre de comptes hfr" from p where exists group by longueur) b left outer join (select profileurl, pseudal, char_length(pseudal) longueur from p where char_length(pseudal) in (select l from (select char_length(pseudal) l, count(*) c from p where exists group by l) a where c = 1)) d using (longueur) order by longueur
select id, profileurl, pseudal from p where char_length(pseudal) = 0 -- https://forum.hardware.fr/hfr/profil-781829.htm
select id, profileurl, pseudal, char_length(pseudal) length from p where exists and char_length(pseudal) < 3 or char_length(pseudal) > 29 order by length
select avg(char_length(pseudal)) from p where exists -- 8.2319572085949893
select percentile_cont(0.5) within group (order by char_length(pseudal)) from p where exists -- 8


-- les pseudals les plus encodés
-- sythèse
select octet_length(pseudal) - char_length(pseudal) "nombre d'octets de plus que de caractères", count(*) "nombre de comptes hfr" from p where exists group by octet_length(pseudal) - char_length(pseudal) order by octet_length(pseudal) - char_length(pseudal) desc
-- tableau
select rank() over (order by octet_length(pseudal) - char_length(pseudal) desc, char_length(pseudal) asc, pseudal asc) rang, profileurl, pseudal, rank() over (order by pseudal asc) pseudal_order, char_length(pseudal) longueur, octet_length(pseudal) "nombre d'octets", octet_length(pseudal) - char_length(pseudal) "nombre d'octets de plus que de caractères", nbposts "nombre de posts", to_char(date - lastpostdate, 'FMDDD') "dernier post avant la collecte" from p where exists and octet_length(pseudal) - char_length(pseudal) >= 3 order by octet_length(pseudal) - char_length(pseudal) desc, char_length(pseudal) asc, pseudal asc
-- fake symaski62 https://forum.hardware.fr/hfr/profil-1058152.htm caractères cyrillic https://www.fileformat.info/info/unicode/block/cyrillic/list.htm
select lpad(to_hex(ascii(c)), 4, '0') unicode, encode(convert_to(c, 'UTF8'), 'hex') "UTF-8", c from (select unnest(regexp_matches(pseudal, '(.)', 'g')) c from p where id=1058152) a order by unicode


-- les nombres de posts
-- les comptes sans posts
select count(*) from p where exists and nbposts = 0 -- 483666
-- le taupe mille
select rank() over (order by nbposts desc, pseudal asc) rang, profileurl, pseudal, rank() over (order by pseudal asc) pseudal_order, nbposts "nombre de posts", to_char(date - lastpostdate, 'FMDDD') "dernier post avant la collecte" from p order by nbposts desc, pseudal asc limit 1000
-- le nombre de posts total
select sum(nbposts) from p -- 140523184
-- courbes de lorenz
-- PAGINER ! -> Télécharger csv -> data_courbes_lorenz_posts_1.txt et data_courbes_lorenz_posts_2.txt
select row_number() over (order by nbposts asc, pseudal asc) posteur, sum(nbposts) over (order by nbposts asc, pseudal asc) posts from p where exists order by nbposts asc, pseudal asc
select row_number() over (order by nbposts asc, pseudal asc) posteur, sum(nbposts) over (order by nbposts asc, pseudal asc) posts from p where exists and nbposts > 0 order by nbposts asc, pseudal asc
-- coefficients de gini ( https://fr.wikipedia.org/wiki/Coefficient_de_Gini )
-- n ( 1143580 )
select count(*) from p where exists
-- somme de iyi ( 158749482128625 )
select sum(posteur * nbposts) from (select row_number() over (order by nbposts asc, pseudal asc) posteur, nbposts from p where exists order by nbposts asc, pseudal asc) a
-- somme de yi ( 140346602 )
select sum(nbposts) from p where exists
-- 0,97821580487158828962801593476141 -> 97,82%
-- n ( 660046 )
select count(*) from p where exists and nbposts > 0
-- somme de iyi ( 90887128277157 )
select sum(posteur * nbposts) from (select row_number() over (order by nbposts asc, pseudal asc) posteur, nbposts from p where exists and nbposts > 0 order by nbposts asc, pseudal asc) a
-- somme de yi ( 140346602 )
select sum(nbposts) from p where exists and nbposts > 0
-- 0,96225722167099101616070162181796 -> 96,23%
-- répartitions en quintiles
select percentile_disc(array[0,0.2,0.4,0.6,0.8,1]) within group (order by nbposts asc) from p where exists -- {0,0,0,2,8,207555}
select percentile_disc(array[0,0.2,0.4,0.6,0.8,1]) within group (order by nbposts asc) from p where exists and nbposts > 0 -- {1,1,2,6,23,207555}
-- deciles sur le top 10%
select percentile_disc(array[.9,.91,.92,.93,.94,.95,.96,.97,.98,.99,1]) within group (order by nbposts asc) from p where exist -- {30,37,46,60,81,115,175,297,605,1818,207555}
select percentile_disc(array[.9,.91,.92,.93,.94,.95,.96,.97,.98,.99,1]) within group (order by nbposts asc) from p where exist and nbposts > 0 -- {87,107,134,172,228,318,472,776,1476,3913,207555}
-- deciles sur le top 1%
select percentile_disc(array[.99,.991,.992,.993,.994,.995,.996,.997,.998,.999,1]) within group (order by nbposts asc) from p where exist -- {1818,2123,2507,3005,3730,4712,6221,8538,12491,22413,207555}
select percentile_disc(array[.99,.991,.992,.993,.994,.995,.996,.997,.998,.999,1]) within group (order by nbposts asc) from p where exist and nbposts > 0 -- {3913,4497,5224,6143,7289,8877,10942,14179,20055,32032,207555}
-- sommes des posts sur les déciles sur le top 1%
select case when nbposts > 22413 then 99.95 when nbposts > 12491 then 99.85 when nbposts > 8538 then 99.75 when nbposts > 6221 then 99.65 when nbposts > 4712 then 99.55 when nbposts > 3730 then 99.45 when nbposts > 3005 then 99.35 when nbposts > 2507 then 99.25 when nbposts > 2123 then 99.15 when nbposts > 1818 then 99.05 end class, sum(nbposts) sum, round(sum(nbposts)::numeric * 100::numeric / 140346602::numeric, 2) part from p where exist and nbposts > 1818 group by class order by class asc
select case when nbposts > 32032 then 99.95 when nbposts > 20055 then 99.85 when nbposts > 14179 then 99.75 when nbposts > 10942 then 99.65 when nbposts > 8877 then 99.55 when nbposts > 7289 then 99.45 when nbposts > 6143 then 99.35 when nbposts > 5224 then 99.25 when nbposts > 4497 then 99.15 when nbposts > 3913 then 99.05 end class, sum(nbposts) sum, round(sum(nbposts)::numeric * 100::numeric / 140346602::numeric, 2) part from p where exist and nbposts > 3913 group by class order by class asc
-- medians
select percentile_disc(0.5) within group (order by nbposts asc) from p where exists -- 1
select percentile_disc(0.5) within group (order by nbposts asc) from p where exists and nbposts > 0 -- 4
-- moyennes
select avg(nbposts::numeric)::numeric from p where exists -- 122.7256527746200528
select count(*):m:numeric from p where exists and nbposts < 122.7256527746200528::numeric -- 1 088 234
select count(*)::numeric * 100::numeric / (select count(*)::numeric from p where exists)::numeric from p where exists and nbposts < 122.7256527746200528::numeric
-- -> 95.1602861190297137
select avg(nbposts::numeric)::numeric from p where exists and nbposts > 0 -- 212.6315468921863022
select count(*)::numeric from p where exists and nbposts > 0 and nbposts < 212.6315468921863022 -- 618 933
select count(*)::numeric * 100::numeric / (select count(*)::numeric from p where exists and nbposts > 0)::numeric from p where exists and nbposts > 0 and nbposts < 212.6315468921863022::numeric
-- -> 93.7711917048205731
-- pie des posteurs par class de nombre de posts
select case when nbposts > 100000 then 6 when nbposts > 10000 then 5 when nbposts > 1000 then 4 when nbposts > 100 then 3 when nbposts > 10 then 2 when nbposts > 0 then 1 when nbposts = 0 then 0 end class, count(*), count(*)::numeric * 360::numeric / (sum(count(*)) over ())::numeric angle, sum(count(*)) over () from p where exist group by class order by class
select case when nbposts > 100000 then 6 when nbposts > 10000 then 5 when nbposts > 1000 then 4 when nbposts > 100 then 3 when nbposts > 10 then 2 when nbposts > 0 then 1 when nbposts = 0 then 0 end class, count(*), count(*)::numeric * 360::numeric / (sum(count(*)) over ())::numeric angle from p where exist group by class order by class
select case when nbposts > 100000 then 6 when nbposts > 10000 then 5 when nbposts > 1000 then 4 when nbposts > 100 then 3 when nbposts > 10 then 2 when nbposts > 0 then 1 end class, count(*), count(*)::numeric * 360::numeric / (sum(count(*)) over ())::numeric angle from p where exist and nbposts > 0 group by class order by class
select case when nbposts > 100000 then 6 when nbposts > 10000 then 5 when nbposts > 1000 then 4 when nbposts > 100 then 3 when nbposts > 10 then 2 when nbposts > 0 then 1 end class, count(*), count(*)::numeric * 360::numeric / (sum(count(*)) over ())::numeric angle from p where exist and nbposts > 0 group by class order by class

select case when nbposts > 100000 then 100001 when nbposts > 10000 then 10001 when nbposts > 1000 then 1001 when nbposts > 100 then 101 when nbposts > 10 then 11 when nbposts > 0 then 1 when nbposts = 0 then 0 end nbp, count(*) c from p where exist group by nbp order by nbp


-- nbposts / avatar / nbsmileys
select row_number() over (order by nbposts asc, pseudal asc), nbposts, (avatarurl is not null)::integer avatar from p where exists order by  nbposts asc, pseudal asc
select floor * 1000, round(avg(ava) * 100, 2) ava, round(avg(ava) * 100, 2) ava, round(avg(ava) * 100, 2) ava, round(avg(ava) * 100, 2) ava, round(avg(ava) * 100, 2) ava, round(avg(ava) * 100, 2) ava, round(avg(ava) * 100, 2) ava, round(avg(ava) * 100, 2) ava, round(avg(ava) * 100, 2) ava from (select floor(row_number() over (order by nbposts asc, pseudal asc) / 1000) floor, (avatarurl is not null)::integer ava, (smiley01 is not null)::integer s01, (smiley01 is not null)::integer s01, (smiley01 is not null)::integer s01, (smiley01 is not null)::integer s01, (smiley01 is not null)::integer s01, (smiley01 is not null)::integer s01, (smiley01 is not null)::integer s01, (smiley01 is not null)::integer s01, (smiley09 is not null)::integer s09, (smiley10 is not null)::integer s10, (smiley11 is not null)::integer s11 from p where exists) a group by floor order by floor asc



-- le nb de smileys
-- total
select sum(nbsmileys) from p -- 26262
-- possible
select 11 * count(*) from p where exists -- 12585705
-- soit
select sum(nbsmileys)::numeric * 100::numeric / (11::numeric * count(*)::numeric) from p where exists -- 0.20866530718779758464
-- les nbsmileys par nbposts (sort of)
select nbsmileys, sum((nbposts = 0)::integer) "0 post", sum((nbposts > 0 and nbposts < 11)::integer) "1+ post(s)", sum((nbposts > 10 and nbposts < 101)::integer) "11+ posts", sum((nbposts > 100 and nbposts < 1001)::integer) "101+ posts", sum((nbposts > 1000 and nbposts < 10001)::integer) "1 001+ posts", sum((nbposts > 10000 and nbposts < 100001)::integer) "10 001+ posts", sum((nbposts > 100000)::integer) "100 001+ posts", count(*) total from p where exist group by nbsmileys order by nbsmileys
-- les nbsmileys par nbposts (sort of) en %
select nbsmileys, round(sum((nbposts = 0)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "0 post", round(sum((nbposts > 0 and nbposts < 11)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "1+ post(s)", round(sum((nbposts > 10 and nbposts < 101)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "11+ posts", round(sum((nbposts > 100 and nbposts < 1001)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "101+ posts", round(sum((nbposts > 1000 and nbposts < 10001)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "1 001+ posts", round(sum((nbposts > 10000 and nbposts < 100001)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "10 001+ posts", round(sum((nbposts > 100000)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "100 001+ posts", count(*) total from p where exist group by nbsmileys order by nbsmileys
-- les nbposts par nbsmileys (sort of)
select case when nbposts > 100000 then 6 when nbposts > 10000 then 5 when nbposts > 1000 then 4 when nbposts > 100 then 3 when nbposts > 10 then 2 when nbposts > 0 then 1 when nbposts = 0 then 0 end nbp, sum((nbsmileys = 0)::integer) "0", sum((nbsmileys = 1)::integer) "1", sum((nbsmileys = 2)::integer) "2", sum((nbsmileys = 3)::integer) "3", sum((nbsmileys = 4)::integer) "4", sum((nbsmileys = 5)::integer) "5", sum((nbsmileys = 6)::integer) "6", sum((nbsmileys = 7)::integer) "7", sum((nbsmileys = 8)::integer) "8", sum((nbsmileys = 9)::integer) "9", sum((nbsmileys = 10)::integer) "10", sum((nbsmileys = 11)::integer) "11", count(*) total from p where exist group by nbp order by nbp
-- les nbposts par nbsmileys (sort of) en %
select case when nbposts > 100000 then 6 when nbposts > 10000 then 5 when nbposts > 1000 then 4 when nbposts > 100 then 3 when nbposts > 10 then 2 when nbposts > 0 then 1 when nbposts = 0 then 0 end nbp, round(sum((nbsmileys = 0)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "0", round(sum((nbsmileys = 1)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "1", round(sum((nbsmileys = 2)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "2", round(sum((nbsmileys = 3)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "3", round(sum((nbsmileys = 4)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "4", round(sum((nbsmileys = 5)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "5", round(sum((nbsmileys = 6)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "6", round(sum((nbsmileys = 7)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "7", round(sum((nbsmileys = 8)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "8", round(sum((nbsmileys = 9)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "9", round(sum((nbsmileys = 10)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "10", round(sum((nbsmileys = 11)::integer)::numeric * 100::numeric / count(*)::numeric, 2) "11", count(*) total from p where exist group by nbp order by nbp
-- les gens avec 11 smileys
select * from p where nbsmileys = 11 -- 215
-- les 100 001+ sans smileys
select * from p where nbposts > 100001 and nbsmileys = 0 -- 4
-- les 100 001+ avec 11 smileys
select * from p where nbposts > 100001 and nbsmileys = 11 -- 1
-- les 100 001+ avec 6+ smileys
select * from p where nbposts > 100001 and nbsmileys >= 6 -- 18 (13 + 4 + 1)
-- les gens avec des trous dans les smileys
select * from p where (smiley1 is null and smiley2 is not null) or (smiley2 is null and smiley3 is not null) or (smiley3 is null and smiley4 is not null) or (smiley4 is null and smiley5 is not null) or (smiley5 is null and smiley6 is not null) or (smiley6 is null and smiley7 is not null) or (smiley7 is null and smiley8 is not null) or (smiley8 is null and smiley9 is not null) or (smiley9 is null and smiley10 is not null) or (smiley10 is null and smiley11 is not null) -- 198
-- les nbsmileys mouyen et médians
select percentile_cont(0.5) within group (order by nbsmileys asc) from p where exists -- 0
select percentile_cont(0.5) within group (order by nbsmileys asc) from p where exists and nbsmileys > 0 -- 1
-- moyennes
select avg(nbsmileys::numeric)::numeric from p where exists -- 0.02295318379065773431
select avg(nbsmileys::numeric)::numeric from p where exists and nbsmileys > 0 -- 2.1233829236739974


-- les dates
-- dates de creation valides (> 2000)
select date_part('year', creationdate) creationyear, count(*) from p where exists and date_part('year', creationdate) >= 2000 group by creationyear order by creationyear
-- toutes les dates de creation avec repport des dates invalides sur 2000
select date_part('year', case when creationdate is null or creationdate < '2000-01-01' then '2000-01-01' else creationdate end) creationyear, count(*) from p where exists group by creationyear order by creationyear
-- dates de creation valides (> 2000) et nbposts > 0
select date_part('year', creationdate) creationyear, count(*) from p where exists and date_part('year', creationdate) >= 2000 and nbposts > 0 group by creationyear order by creationyear
-- toutes les dates de creation avec repport des dates invalides sur 2000 et nbposts > 0
select date_part('year', case when creationdate is null or creationdate < '2000-01-01' then '2000-01-01' else creationdate end) creationyear, count(*) from p where exists and nbposts > 0 group by creationyear order by creationyear
-- les 4
select c2000.y year, c2000.c c2000, call.c call, c2000posts.c c2000posts, callposts.c callposts from
(select date_part('year', creationdate) y, count(*) c from p where exists and date_part('year', creationdate) >= 2000 group by y) c2000 left outer join
(select date_part('year', case when creationdate is null or creationdate < '2000-01-01' then '2000-01-01' else creationdate end) y, count(*) c from p where exists group by y) call using (y) left outer join
(select date_part('year', creationdate) y, count(*) c from p where exists and date_part('year', creationdate) >= 2000 and nbposts > 0 group by y) c2000posts using (y) left outer join
(select date_part('year', case when creationdate is null or creationdate < '2000-01-01' then '2000-01-01' else creationdate end) y, count(*) c from p where exists and nbposts > 0 group by y) callposts using (y)
order by year
-- date de création moyenne et médianne
select avg(creationyear) from (select date_part('year', case when creationdate is null or creationdate < '2000-01-01' then '2000-01-01' else creationdate end) creationyear from p where exists order by creationyear) a -- 2008.05765302778
select percentile_cont(0.5) within group (order by creationyear asc) from (select date_part('year', case when creationdate is null or creationdate < '2000-01-01' then '2000-01-01' else creationdate end) creationyear from p where exists order by creationyear) a -- 2007
-- dates de lastpost valides (> 2002)
select date_part('year', lastpostdate) lastpostyear, count(*) from p where date_part('year', lastpostdate) >= 2002 and nbposts > 0 group by lastpostyear order by lastpostyear
-- toutes les dates de lastpost avec report des dates invalides sur 2002
select date_part('year', case when lastpostdate is null or lastpostdate < '2002-01-01' then '2002-01-01' else lastpostdate end) lastpostyear, count(*) from p where nbposts > 0 group by lastpostyear order by lastpostyear
-- les 2
select l2000.y year, l2000.c l2000, lall.c lall from
(select date_part('year', lastpostdate) y, count(*) c from p where date_part('year', lastpostdate) >= 2002 and nbposts > 0 group by y) l2000 left outer join
(select date_part('year', case when lastpostdate is null or lastpostdate < '2002-01-01' then '2002-01-01' else lastpostdate end) y, count(*) c from p where nbposts > 0 group by y) lall using (y)
order by year
-- actifs (cumul creationdate - cumul lastpostdate)
with data(cy, ly) (select
date_part('year', case when creationdate is null or creationdate < '2000-01-01' then '2000-01-01' else creationdate end) cy,
date_part('year', case when lastpostdate is null or lastpostdate < '2002-01-01' then '2002-01-01' else lastpostdate end) ly
from p where nbposts > 0),
c(y,c) (select cy y, count(*) from data group by y),
l(y,l) (select ly y, count(*) from data where ly < 2019 group by y)
select y, c, l, sum(coalesce(c, 0)) over (order by y asc) cs, sum(coalesce(l, 0)) over (order by y asc) ls,
sum(coalesce(c, 0) - coalesce(l, 0)) over (order by y asc) "cs - ls" from c left outer join l using (y)


-- l'age des actifs
select count(*) nb from p where lastpostdate >= '2019-01-01' -- 19453
-- age forumesque
select date_part('year', age(creationdate)) age, count(*) nb from p where lastpostdate >= '2019-01-01' group by age order by age asc
select date_part('year', creationdate) cy, count(*) nb from p where lastpostdate >= '2019-01-01' group by cy order by cy desc
-- age forumesque moyen et médian
select avg(age) from (select date_part('year', age(creationdate)) age from p where lastpostdate >= '2019-01-01' order by age asc) a -- 7.83169691050224
select percentile_cont(0.5) within group (order by age asc) from (select date_part('year', age(creationdate)) age from p where lastpostdate >= '2019-01-01' order by age asc) a -- 8
-- age "reel"
select date_part('year', age(birthdate)) age, count(*) nb from p where lastpostdate >= '2019-01-01' group by age order by age asc nulls first -- 1-99
select age, coalesce(nb, 0) from generate_series(1, 99) s(age) left outer join (select date_part('year', age(birthdate)) age, count(*) nb from p where lastpostdate >= '2019-01-01' and date_part('year', age(birthdate)) >= 1 and date_part('year', age(birthdate)) <= 99 group by age) t using (age) order by age asc
-- age "reel" moyen et médian
select avg(age) from (select date_part('year', age(birthdate)) age from p where lastpostdate >= '2019-01-01' and date_part('year', age(birthdate)) >= 1 and date_part('year', age(birthdate)) <= 99 order by age) a -- 35.0296630057261
select percentile_cont(0.5) within group (order by a asc) from (select date_part('year', age(birthdate)) a from p where lastpostdate >= '2019-01-01' and date_part('year', age(birthdate)) >= 1 and date_part('year', age(birthdate)) <= 99 order by a) a -- 34
-- pie
select case when date_part('year', age(birthdate)) < 1 then 'pas renseigné ou foireux' when date_part('year', age(birthdate)) > 99 then 'pas renseigné ou foireux' when birthdate is null then 'pas renseigné ou foireux' else 'renseigné et ok' end age, 0 x, 0 y, 0.95 r, count(*)::numeric * 360::numeric / (sum(count(*)) over ())::numeric angle, round(count(*)::numeric * 100::numeric / (sum(count(*)) over ())::numeric, 2) percent, count(*) nombre, sum(count(*)) over () somme from p where lastpostdate >= '2019-01-01' group by age order by age desc


-- les champs
-- les champs longs
select town, char_length(town) "char"  from p where town is not null order by char_length(town) desc limit 200
select work, char_length(work) "char"  from p where work is not null order by char_length(work) desc limit 200
select hobby, char_length(hobby) "char"  from p where hobby is not null order by char_length(hobby) desc limit 200
select quote, char_length(quote) "char"  from p where quote is not null order by char_length(quote) desc limit 200
select signature, char_length(signature) "char"  from p where signature is not null order by char_length(signature) desc limit 200
-- la taille max des champs
select 'profileurl' champ, max(char_length(profileurl)) "char", max(bit_length(profileurl)) "bit" from p union
select 'pseudal' champ, max(char_length(pseudal)) "char", max(bit_length(pseudal)) "bit" from p union
select 'email' champ, max(char_length(email)) "char", max(bit_length(email)) "bit" from p union
select 'realbirthdate' champ, max(char_length(realbirthdate)) "char", max(bit_length(realbirthdate)) "bit" from p union
select 'sex' champ, max(char_length(sex)) "char", max(bit_length(sex)) "bit" from p union
select 'town' champ, max(char_length(town)) "char", max(bit_length(town)) "bit" from p union
select 'work' champ, max(char_length(work)) "char", max(bit_length(work)) "bit" from p union
select 'hobby' champ, max(char_length(hobby)) "char", max(bit_length(hobby)) "bit" from p union
select 'status' champ, max(char_length(status)) "char", max(bit_length(status)) "bit" from p union
select 'realcreationdate' champ, max(char_length(realcreationdate)) "char", max(bit_length(realcreationdate)) "bit" from p union
select 'reallastpostdate' champ, max(char_length(reallastpostdate)) "char", max(bit_length(reallastpostdate)) "bit" from p union
select 'quote' champ, max(char_length(quote)) "char", max(bit_length(quote)) "bit" from p union
select 'signature' champ, max(char_length(signature)) "char", max(bit_length(signature)) "bit" from p union
select 'configurl' champ, max(char_length(configurl)) "char", max(bit_length(configurl)) "bit" from p union
select 'colorsurl' champ, max(char_length(colorsurl)) "char", max(bit_length(colorsurl)) "bit" from p union
select 'transactionavurl' champ, max(char_length(transactionavurl)) "char", max(bit_length(transactionavurl)) "bit" from p union
select 'transactionjvurl' champ, max(char_length(transactionjvurl)) "char", max(bit_length(transactionjvurl)) "bit" from p union
select 'pmurl' champ, max(char_length(pmurl)) "char", max(bit_length(pmurl)) "bit" from p union
select 'postsurl' champ, max(char_length(postsurl)) "char", max(bit_length(postsurl)) "bit" from p union
select 'contacturl' champ, max(char_length(contacturl)) "char", max(bit_length(contacturl)) "bit" from p union
select 'avatarurl' champ, max(char_length(avatarurl)) "char", max(bit_length(avatarurl)) "bit" from p union
select 'smiley01' champ, max(char_length(smiley01)) "char", max(bit_length(smiley01)) "bit" from p union
select 'smiley01url' champ, max(char_length(smiley01url)) "char", max(bit_length(smiley01url)) "bit" from p union
select 'smiley02' champ, max(char_length(smiley02)) "char", max(bit_length(smiley02)) "bit" from p union
select 'smiley02url' champ, max(char_length(smiley02url)) "char", max(bit_length(smiley02url)) "bit" from p union
select 'smiley03' champ, max(char_length(smiley03)) "char", max(bit_length(smiley03)) "bit" from p union
select 'smiley03url' champ, max(char_length(smiley03url)) "char", max(bit_length(smiley03url)) "bit" from p union
select 'smiley04' champ, max(char_length(smiley04)) "char", max(bit_length(smiley04)) "bit" from p union
select 'smiley04url' champ, max(char_length(smiley04url)) "char", max(bit_length(smiley04url)) "bit" from p union
select 'smiley05' champ, max(char_length(smiley05)) "char", max(bit_length(smiley05)) "bit" from p union
select 'smiley05url' champ, max(char_length(smiley05url)) "char", max(bit_length(smiley05url)) "bit" from p union
select 'smiley06' champ, max(char_length(smiley06)) "char", max(bit_length(smiley06)) "bit" from p union
select 'smiley06url' champ, max(char_length(smiley06url)) "char", max(bit_length(smiley06url)) "bit" from p union
select 'smiley07' champ, max(char_length(smiley07)) "char", max(bit_length(smiley07)) "bit" from p union
select 'smiley07url' champ, max(char_length(smiley07url)) "char", max(bit_length(smiley07url)) "bit" from p union
select 'smiley08' champ, max(char_length(smiley08)) "char", max(bit_length(smiley08)) "bit" from p union
select 'smiley08url' champ, max(char_length(smiley08url)) "char", max(bit_length(smiley08url)) "bit" from p union
select 'smiley09' champ, max(char_length(smiley09)) "char", max(bit_length(smiley09)) "bit" from p union
select 'smiley09url' champ, max(char_length(smiley09url)) "char", max(bit_length(smiley09url)) "bit" from p union
select 'smiley10' champ, max(char_length(smiley10)) "char", max(bit_length(smiley10)) "bit" from p union
select 'smiley10url' champ, max(char_length(smiley10url)) "char", max(bit_length(smiley10url)) "bit" from p union
select 'smiley11' champ, max(char_length(smiley11)) "char", max(bit_length(smiley11)) "bit" from p union
select 'smiley11url' champ, max(char_length(smiley11url)) "char", max(bit_length(smiley11url)) "bit" from p
order by champ
-- les champs vides
select '''' || town || '''', count(*), sum(count(*)) over() from p where trim(town) = '' group by town -- 46
select '''' || work || '''', count(*), sum(count(*)) over() from p where trim(work) = '' group by work -- 39
select '''' || hobby || '''', count(*), sum(count(*)) over() from p where trim(hobby) = '' group by hobby -- 40
select '''' || quote || '''', count(*), sum(count(*)) over() from p where trim(quote) = '' group by quote --145
select '''' || signature || '''', count(*), sum(count(*)) over() from p where trim(signature) = '' group by signature -- 69
-- les champs renseignés
select date_part('year', age(birthdate)) age, count(*) nb from p where exists group by age order by age asc nulls first -- 1-99
select 'visible' champ, visible::varchar valeur, count(*) count from p where exists group by visible union
select 'email' champ, email valeur, count(*) count from p where exists group by email union
select 'sex' champ, sex valeur, count(*) count from p where exists group by sex union
select 'town' champ, town is not null::varchar valeur, count(*) count from p where exists group by town is not null union
select 'work' champ, work is not null::varchar valeur, count(*) count from p where exists group by work is not null union
select 'hobby' champ, hobby is not null::varchar valeur, count(*) count from p where exists group by hobby is not null union
select 'status' champ, status valeur, count(*) count from p where exists group by status union
select 'quote' champ, quote is not null::varchar valeur, count(*) count from p where exists group by quote is not null union
select 'signature' champ, signature is not null::varchar valeur, count(*) count from p where exists group by signature is not null union
select 'configurl' champ, configurl is not null::varchar valeur, count(*) count from p where exists group by configurl is not null union
select 'colorsurl' champ, colorsurl is not null::varchar valeur, count(*) count from p where exists group by colorsurl is not null union
select 'avatarurl' champ, avatarurl is not null::varchar valeur, count(*) count from p where exists group by avatarurl is not null union
select 'visible post' champ, visible::varchar valeur, count(*) count from p where exists and nbposts > 0 group by visible union
select 'email post' champ, email valeur, count(*) count from p where exists and nbposts > 0 group by email union
select 'sex post' champ, sex valeur, count(*) count from p where exists and nbposts > 0 group by sex union
select 'town post' champ, town is not null::varchar valeur, count(*) count from p where exists and nbposts > 0 group by town is not null union
select 'work post' champ, work is not null::varchar valeur, count(*) count from p where exists and nbposts > 0 group by work is not null union
select 'hobby post' champ, hobby is not null::varchar valeur, count(*) count from p where exists and nbposts > 0 group by hobby is not null union
select 'status post' champ, status valeur, count(*) count from p where exists and nbposts > 0 group by status union
select 'quote post' champ, quote is not null::varchar valeur, count(*) count from p where exists and nbposts > 0 group by quote is not null union
select 'signature post' champ, signature is not null::varchar valeur, count(*) count from p where exists and nbposts > 0 group by signature is not null union
select 'configurl post' champ, configurl is not null::varchar valeur, count(*) count from p where exists and nbposts > 0 group by configurl is not null union
select 'colorsurl post' champ, colorsurl is not null::varchar valeur, count(*) count from p where exists and nbposts > 0 group by colorsurl is not null union
select 'avatarurl post' champ, avatarurl is not null::varchar valeur, count(*) count from p where exists and nbposts > 0 group by avatarurl is not null
order by champ, valeur
-- le top 500 des villes
select a.*, coalesce(b."nombre de comptes hfr actifs en 2019", 0) "nombre de comptes hfr actifs en 2019" from
(select rank() over (order by count(*) desc, lower(replace(town, '-', ' ')) asc) rang, lower(replace(town, '-', ' ')) ville, rank() over (order by lower(replace(town, '-', ' ')) asc) ville_order, count(*) "nombre de comptes hfr" from p where town is not null and trim(town) != '' group by lower(replace(town, '-', ' ')) order by count(*) desc, lower(replace(town, '-', ' ')) asc limit 500) a left outer join
(select rank() over (order by count(*) desc, lower(replace(town, '-', ' ')) asc) rang, lower(replace(town, '-', ' ')) ville, count(*) "nombre de comptes hfr actifs en 2019" from p where lastpostdate >= '2019-01-01' and town is not null and trim(town) != '' group by lower(replace(town, '-', ' ')) order by count(*) desc, lower(replace(town, '-', ' ')) asc) b using (ville) order by a.rang
-- les extensions des avatars
select rank() over (order by count(*) desc) rang, coalesce(lower(substring(avatarurl from '(\.[a-zA-Z]*)[^.a-zA-Z]*$')), 'pas d''extension') extension, count(*) count from p where avatarurl is not null group by coalesce(lower(substring(avatarurl from '(\.[a-zA-Z]*)[^.a-zA-Z]*$')), 'pas d''extension') order by count(*) desc, coalesce(lower(substring(avatarurl from '(\.[a-zA-Z]*)[^.a-zA-Z]*$')), 'pas d''extension') -- 1 .jpg 29119 / 2 .gif 5098 / 3 .png 4119
-- les nombres de transactions
select 'jv' "type", nbtransactionjv nb, count(*) count from p where exists group by nbtransactionjv union select 'av' "type", nbtransactionav nb, count(*) count from p where exists group by nbtransactionav order by "type", nb
select profileurl, pseudal, nbtransactionjv from p where exists order by nbtransactionjv desc limit 200
select profileurl, pseudal, nbtransactionav from p where exists order by nbtransactionjv desc limit 200
-- les statuts
select status statut, count(*) "nombre de comptes hfr" from p where exists group by status order by status
select profileurl, pseudal, rank() over (order by pseudal asc) pseudal_order, status statut, nbposts "nombre de posts", to_char(date - lastpostdate, 'FMDDD') "dernier post avant la collecte" from p where exists and status != 'Membre' order by status, pseudal


-- analyse des header
-- les champs
select distinct 'http' "column", httpheader->'http' "data" from p union
select distinct 'Pragma' "column", httpheader->'Pragma' "data" from p union
select distinct 'Server' "column", httpheader->'Server' "data" from p union
select distinct 'Status' "column", httpheader->'Status' "data" from p union
select distinct 'Expires' "column", httpheader->'Expires' "data" from p union
select distinct 'Connection' "column", httpheader->'Connection' "data" from p union
select distinct 'Content-Type' "column", httpheader->'Content-Type' "data" from p union
select distinct 'Cache-Control' "column", httpheader->'Cache-Control' "data" from p order by "column" -- ou order by 1
-- les dates
select 'min' minmax, min((httpheader->>'Date')::timestamp with time zone) date from p union select 'max' minmax, max((httpheader->>'Date')::timestamp with time zone) date from p order by date asc
(select id, profileurl, pseudal, date, (httpheader->>'Date')::timestamp with time zone dateh from p order by dateh asc, id asc limit 10) union
(select id, profileurl, pseudal, date, (httpheader->>'Date')::timestamp with time zone dateh from p order by dateh desc, id asc limit 10) order by dateh asc, id asc
(select id, profileurl, pseudal, date, (httpheader->>'Date')::timestamp with time zone dateh from p order by date asc, id asc limit 10) union
(select id, profileurl, pseudal, date, (httpheader->>'Date')::timestamp with time zone dateh from p order by date desc, id asc limit 10) order by date asc, id asc
-- les tailles
select 'min' minmax, min((httpheader->>'Content-Length')::integer) size from p union select 'max' minmax, max((httpheader->>'Content-Length')::integer) size from p order by size
(select id, profileurl, pseudal, (httpheader->>'Content-Length')::integer size from p order by size asc, id asc limit 10) union
(select id, profileurl, pseudal, (httpheader->>'Content-Length')::integer size from p order by size desc, id asc limit 10) order by size asc, id asc


