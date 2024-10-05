

# pour générer les xtics des années :
# select string_agg(y, ', ') from (select '"' || date_part('year'::text, x::date) || '" ' || date_part('epoch'::text, x::date) from (values ('2007-01-01'), ('2008-01-01'), ('2009-01-01'), ('2010-01-01'), ('2011-01-01'), ('2012-01-01'), ('2013-01-01'), ('2014-01-01'), ('2015-01-01'), ('2016-01-01'), ('2017-01-01'), ('2018-01-01'), ('2019-01-01'), ('2020-01-01'), ('2021-01-01'), ('2022-01-01'), ('2023-01-01'), ('2024-01-01')) t(x)) a(y)


# pour générer les ranges :
# select x, date_part('epoch'::text, x::date) from (values ('2006-07-01'), ('2007-07-01'), ('2022-07-01'), ('2023-07-01'), ('2024-07-01')) t(x)


cd "/home/moi/devs/www/smi/upd/"


# des nombres cumulés en fonction du temps

unset multiplot
reset session
reset
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "graph_cumul_20240104170037" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "graph_cumul_20240104170037.svg"
set title "{/:Bold=18 des nombres cumulés en fonction du temps au jeudi 4 janvier 2024 à 17:00:37"
set xlabel "{/=16 du temps"
set ylabel "{/=16 des nombres cumulés"
set y2label "{/=16 des nombres cumulés plus grands (y2)"
set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
set key at graph .05, graph .95 top left Left opaque reverse samplen 3 box spacing 1.2 height .7 width -18.5
set xtics ("2007" 1167609600, "2008" 1199145600, "2009" 1230768000, "2010" 1262304000, "2011" 1293840000, "2012" 1325376000, "2013" 1356998400, "2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200)
set ytics 5000
set mytics 5
set y2tics 50000
set link y2 via y * 10 inverse y / 10
set format y "%.0f"
set format y2 "%.0f"
set xdata time
set timefmt "%s"
set format x "%F %T"
set mouse mouseformat "DateTime"

set size .985,1
set origin .015,0

# 2007-07-01:date collecte + 6 mois ou Y-07-01
plot [1183248000:1719792000][0:35000] \
"data_first_edit_cumul_20240104170037.txt" u 1:2 w lines lw 2 lc rgbcolor "#3cb44b" title "le nombre de premières éditions (a.k.a. le nombre de smileys dans le wiki)", \
"data_distinct_tags_cumul_20240104170037.txt" u 1:2 w lines lw 2 lc rgbcolor "#f58231" title "le nombre de mots-clés valides distincts et toujours utilisés", \
"data_tags_cumul_20240104170037.txt" u 1:2 axes x1y2 w lines lw 2 lc rgbcolor "#f032e6" title "le nombre total de mots-clés valides utilisés (sur y2)", \
"data_edits_cumul_20240104170037.txt" u 1:2 axes x1y2 w lines lw 2 lc rgbcolor "#4363d8" title "le nombre d'éditions (sur y2)", \
"data_real_edits_cumul_20240104170037.txt" u 1:2 axes x1y2 w lines lw 2 lc rgbcolor "#42d4f4" title "le nombre d'éditions avec modification (sur y2)"

set output


# des nombres par an en fonction du temps

unset multiplot
reset session
reset
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "graph_year_20240104170037" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "graph_year_20240104170037.svg"
set title "{/:Bold=18 des nombres par an au jeudi 4 janvier 2024 à 17:00:37"
set xlabel "{/=16 des ans"
set ylabel "{/=16 des nombres par an"
set y2label "{/=16 des nombres par an plus grands (y2)"
set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
set key at graph .95, graph .95 top right Left opaque reverse samplen 3 box spacing 1.2 height .7 width -25
set xtics ("2007" 1167609600, "2008" 1199145600, "2009" 1230768000, "2010" 1262304000, "2011" 1293840000, "2012" 1325376000, "2013" 1356998400, "2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200)
set ytics 1000
set mytics 5
set y2tics 10000
set link y2 via y * 10 inverse y / 10
set format y "%.0f"
set format y2 "%.0f"
set xdata time
set timefmt "%s"
set format x "%F %T"
set mouse mouseformat "DateTime"

set size .985,1
set origin .015,0

# 2006-07-01:date collecte + 6 mois ou Y-07-01
plot [1151712000:1719792000][0:5000] \
"data_first_edit_year_20240104170037.txt" u 1:2 w lines lw 2 lc rgbcolor "#3cb44b" title "le nombre de premières éditions par an (a.k.a. le nombre de nouveaux smileys ajoutés par an dans le wiki)", \
"data_distinct_tags_year_20240104170037.txt" u 1:2 w lines lw 2 lc rgbcolor "#f58231" title "le nombre de nouveaux mots-clés valides distincts ajoutés par an et toujours utilisés", \
"data_tags_year_20240104170037.txt" u 1:2 axes x1y2 w lines lw 2 lc rgbcolor "#f032e6" title "le nombre total de nouveaux mots-clés valides ajoutés par an (sur y2)", \
"data_edits_year_20240104170037.txt" u 1:2 axes x1y2 w lines lw 2 lc rgbcolor "#4363d8" title "le nombre de nouvelles éditions par an (sur y2)", \
"data_real_edits_year_20240104170037.txt" u 1:2 axes x1y2 w lines lw 2 lc rgbcolor "#42d4f4" title "le nombre de nouvelles éditions avec modification par an (sur y2)"

set output


# des nombres par mois en fonction du temps

unset multiplot
reset session
reset
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "graph_month_20240104170037" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "graph_month_20240104170037.svg"
set title "{/:Bold=18 des nombres par mois au jeudi 4 janvier 2024 à 17:00:37"
set xlabel "{/=16 des mois"
set ylabel "{/=16 des nombres par mois"
set y2label "{/=16 des nombres par mois plus grands (y2)"
set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
set key at graph .95, graph .95 top right Left opaque reverse samplen 3 box spacing 1.2 height .7 width -26
set xtics ("2007" 1167609600, "2008" 1199145600, "2009" 1230768000, "2010" 1262304000, "2011" 1293840000, "2012" 1325376000, "2013" 1356998400, "2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200)
set ytics 1000
set mytics 10
set y2tics 10000
set link y2 via y * 10 inverse y / 10
set format y "%.0f"
set format y2 "%.0f"
set xdata time
set timefmt "%s"
set format x "%F %T"
set mouse mouseformat "DateTime"

set size .985,1
set origin .015,0

# 2007-07-01:date collecte + 6 mois ou Y-07-01
plot [1183248000:1719792000][-100:3000] \
"data_first_edit_month_20240104170037.txt" u 1:2 w lines lw 1.5 lc rgbcolor "#3cb44b" title "le nombre de premières éditions par mois (a.k.a. le nombre de nouveaux smileys ajoutés par mois dans le wiki)", \
"data_distinct_tags_month_20240104170037.txt" u 1:2 w lines lw 1.5 lc rgbcolor "#f58231" title "le nombre de nouveaux mots-clés valides distincts ajoutés par mois et toujours utilisés", \
"data_tags_month_20240104170037.txt" u 1:2 axes x1y2 w lines lw 1.5 lc rgbcolor "#f032e6" title "le nombre total de nouveaux mots-clés valides ajoutés par mois (sur y2)", \
"data_edits_month_20240104170037.txt" u 1:2 axes x1y2 w lines lw 1.5 lc rgbcolor "#4363d8" title "le nombre de nouvelles éditions par mois (sur y2)", \
"data_real_edits_month_20240104170037.txt" u 1:2 axes x1y2 w lines lw 1.5 lc rgbcolor "#42d4f4" title "le nombre de nouvelles éditions avec modification par mois (sur y2)"

set output


# des nombres par semaine en fonction du temps

unset multiplot
reset session
reset
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "graph_week_20240104170037" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "graph_week_20240104170037.svg"
set title "{/:Bold=18 des nombres par semaine au jeudi 4 janvier 2024 à 17:00:37"
set xlabel "{/=16 des semaines"
set ylabel "{/=16 des nombres par semaine"
set y2label "{/=16 des nombres par semaine plus grands (y2)"
set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
set key at graph .95, graph .95 top right Left opaque reverse samplen 3 box spacing 1.2 height .7 width -27
set xtics ("2007" 1167609600, "2008" 1199145600, "2009" 1230768000, "2010" 1262304000, "2011" 1293840000, "2012" 1325376000, "2013" 1356998400, "2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200)
set ytics 1000
set mytics 10
set y2tics 10000
set link y2 via y * 10 inverse y / 10
set format y "%.0f"
set format y2 "%.0f"
set xdata time
set timefmt "%s"
set format x "%F %T"
set mouse mouseformat "DateTime"

set size .985,1
set origin .015,0

# 2007-07-01:date collecte + 6 mois ou Y-07-01
plot [1183248000:1719792000][-300:3000] \
"data_first_edit_week_20240104170037.txt" u 1:2 w lines lw 1 lc rgbcolor "#3cb44b" title "le nombre de premières éditions par semaine (a.k.a. le nombre de nouveaux smileys ajoutés par semaine dans le wiki)", \
"data_distinct_tags_week_20240104170037.txt" u 1:2 w lines lw 1 lc rgbcolor "#f58231" title "le nombre de nouveaux mots-clés valides distincts ajoutés par semaine et toujours utilisés", \
"data_tags_week_20240104170037.txt" u 1:2 axes x1y2 w lines lw 1 lc rgbcolor "#f032e6" title "le nombre total de nouveaux mots-clés valides ajoutés par semaine (sur y2)", \
"data_edits_week_20240104170037.txt" u 1:2 axes x1y2 w lines lw 1 lc rgbcolor "#4363d8" title "le nombre de nouvelles éditions par semaine (sur y2)", \
"data_real_edits_week_20240104170037.txt" u 1:2 axes x1y2 w lines lw 1 lc rgbcolor "#42d4f4" title "le nombre de nouvelles éditions avec modification par semaine (sur y2)"

set output


