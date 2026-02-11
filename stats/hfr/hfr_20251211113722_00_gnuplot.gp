

# Le nombre de comptes créés par an

unset multiplot
reset session
reset
set encoding utf8
set locale "fr_FR.utf8"
set decimalsign locale "fr_FR.utf8"
set terminal pngcairo size 1920, 1080 font "Verdana,11" rounded dashlength 2 linewidth 1 background "#ffffff"
set output "hfr_20251211113722_g1_account_creations.png"
set title "{/:Bold=14 Le nombre de comptes créés par an au jeudi 11 décembre 2025\n\n{/=12 (données collectées entre le jeudi 11 décembre 2025 à 11:37:22 et le dimanche 14 décembre 2025 à 19:07:11)"
set key at graph .975, graph .97 top right Left opaque reverse samplen 3 box spacing 1.2 height .4 width -4
set style data histogram
set style histogram clustered gap 1
set ytics 0, 25000
set mytics 2
set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
set format y "%'.0f"
set style fill transparent solid .2
set boxwidth 0.75

boldus(s) = gprintf("{/:=12 %'.0f}", s)

set size 1,1
set origin 0,0

plot [-1:26][0:159828.39] \
"hfr_20251211113722_00_data_creations.txt" u 3:xtic(2) lw 2 lc rgbcolor "#ff7f0e" title "le nombre de comptes créés", \
"hfr_20251211113722_00_data_creations.txt" u 4:xtic(2) lw 2 lc rgbcolor "#2ca02c" title "le nombre de comptes créés avec au moins 1 post", \
"hfr_20251211113722_00_data_creations.txt" u 1:($3):(boldus($3)) w labels center rotate by 90 tc rgbcolor "#9030d0" font "Liberation Mono" offset -1.2,2.3 notitle, \
"hfr_20251211113722_00_data_creations.txt" u 1:($4):(boldus($4)) w labels center rotate by 90 tc rgbcolor "#9030d0" font "Liberation Mono" offset 1.2,2.3 notitle

set output

# L'évolution du nombre de comptes actifs

unset multiplot
reset session
reset
set encoding utf8
set locale "fr_FR.utf8"
set decimalsign locale "fr_FR.utf8"
set terminal pngcairo size 1920, 1080 font "Verdana,11" rounded dashlength 2 linewidth 1 background "#ffffff"
set output "hfr_20251211113722_g2_active_accounts.png"
set multiplot title "{/:Bold=14 L'évolution du nombre de comptes actifs au jeudi 11 décembre 2025\n\n{/=12 (données collectées entre le jeudi 11 décembre 2025 à 11:37:22 et le dimanche 14 décembre 2025 à 19:07:11)"
set xtics ("1997" 852076800, "1998" 883612800, "1999" 915148800, "2000" 946684800, "2001" 978307200, "2002" 1009843200, "2003" 1041379200, "2004" 1072915200, "2005" 1104537600, "2006" 1136073600, "2007" 1167609600, "2008" 1199145600, "2009" 1230768000, "2010" 1262304000, "2011" 1293840000, "2012" 1325376000, "2013" 1356998400, "2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200, "2025" 1735689600, "2026" 1767225600, "2027" 1798761600, "2028" 1830297600, "2029" 1861920000)
set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
set style fill transparent solid .4
set format y "%'.0f"
set xdata time
set timefmt "%s"
set format x "%F %T"
set mouse mouseformat "DateTime"

set ytics 0, 400000
set mytics 2

set key at graph .980, graph .10 bottom right Left opaque reverse samplen 3 box spacing 1.2 height .4 width -5
set format y "%'9.0f"

# je donne un espace pour le titre et je divise le reste en 3 pour la taille et la position des graphs
# ici je donne .07 pour le titre donc .07 + 3x = 1 donc x vaut (1 - .07) / 3 soit .93 / 3 soit .31
# et je rajoute k = .015 au graph parce qu'il laisse trop de blanc au dessus

set size 1,.325 # x + k
set origin 0,.62 # 2 x

plot [933123840:1782063360][0:1288233.72] \
"hfr_20251211113722_00_data_active.txt" u 1:2 w lines lw 2 lc rgbcolor "#003fbf" title "le nombre de créations de comptes", \
"hfr_20251211113722_00_data_active.txt" u 1:3 w lines lw 2 lc rgbcolor "#dc3912" title "le nombre de derniers messages", \
"hfr_20251211113722_00_data_active.txt" u 1:2:3 w filledcurves lw 2 lc rgbcolor "#983fcf" title "le nombre de comptes actifs                           "

set ytics 0, 200000
set mytics 2

set key at graph .980, graph .10 bottom right Left opaque reverse samplen 3 box spacing 1.2 height .4 width -5
set format y "%'9.0f"

set size 1,.325 # x + k
set origin 0,.31 # x

plot [933123840:1782063360][0:739707.12] \
"hfr_20251211113722_00_data_active_posters.txt" u 1:2 w lines lw 2 lc rgbcolor "#003fbf" title "le nombre de créations de comptes avec au moins 1 post", \
"hfr_20251211113722_00_data_active_posters.txt" u 1:3 w lines lw 2 lc rgbcolor "#dc3912" title "le nombre de derniers messages", \
"hfr_20251211113722_00_data_active_posters.txt" u 1:2:3 w filledcurves lw 2 lc rgbcolor "#983fcf" title "le nombre de comptes actifs                           "

set ytics 0, 40000
set mytics 2

set key at graph .980, graph .90 top right Left opaque reverse samplen 3 box spacing 1.2 height .4 width -5
set format y "%'9.0f"

set size 1,.325 # x + k
set origin 0,0 # 0

plot [933123840:1782063360][0:87152.76] \
"hfr_20251211113722_00_data_active.txt" u 1:4 w lines lw 2 lc rgbcolor "#983fcf" title "le nombre de comptes actifs                           "

unset multiplot
set output


