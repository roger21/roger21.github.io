

# Le nombre de posts et de participants du topic

unset multiplot
reset session
reset
set encoding utf8
set locale "fr_FR.utf8"
set decimalsign locale "fr_FR.utf8"
set terminal svg size 1920, 1080 dynamic name "cha_20260105170428_g1_counts_all" font "Verdana,Arial,Sans-serif,Helvetica,14" rounded dashlength 2 linewidth 1 background "#ffffff"
set output "cha_20260105170428_g1_counts_all.svg"
set title "{/:Bold=18 Le nombre de posts et de participants all time 2025 du topic Charlie Hebdo\n{/:Bold=14 (données collectées le lundi 5 janvier 2026 à 17:04:28)"
set ylabel "{/=16 le nombre de posts et de smileys"
set y2label "{/=16 le nombre de posts roses et de participants"
set key at graph .025, graph .96 top left Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set xtics ("2004" 1072915200, "2005" 1104537600, "2006" 1136073600, "2007" 1167609600, "2008" 1199145600, "2009" 1230768000, "2010" 1262304000, "2011" 1293840000, "2012" 1325376000, "2013" 1356998400, "2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200, "2025" 1735689600, "2026" 1767225600, "2027" 1798761600, "2028" 1830297600, "2029" 1861920000) rotate
set ytics 0, 40000
set mytics 2
set y2tics 0, 800
set link y2 via y / 50 inverse y * 50
set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
set format y "%'.0f"
set format y2 "%'.0f"
set xdata time
set timefmt "%s"
set format x "%F %T"
set mouse mouseformat "DateTime"

set size .985,1
set origin .015,0

bigger(s) = sprintf("{/:Bold=16 %'.0f", s)

plot [1142287621:1779479286][0:124420.8] \
"cha_20260105170428_00_data_count_posts.txt" u 1:2 w line lw 2 lc rgbcolor "#003fbf" title "le nombre de posts", \
"cha_20260105170428_00_data_count_smileys.txt" u 1:2 w line lw 2 lc rgbcolor "#ff9900" title "le nombre de smileys", \
"cha_20260105170428_00_data_count_participants.txt" u 1:2 axes x1y2 w line lw 2 lc rgbcolor "#109618" title "le nombre de participants (sur y2)", \
"cha_20260105170428_00_data_count_roses.txt" u 1:2 axes x1y2 w line lw 2 lc rgbcolor "#dc3912" title "le nombre de posts roses (sur y2)", \
"cha_20260105170428_00_data_count_posts.txt" every ::118496::118496 u 1:2:(bigger($2)) w labels right tc rgbcolor "#003fbf" point lc rgbcolor "#003fbf" pt 7 ps 1 offset 0,.6 notitle, \
"cha_20260105170428_00_data_count_smileys.txt" every ::58444::58444 u 1:2:(bigger($2)) w labels right tc rgbcolor "#ff9900" point lc rgbcolor "#ff9900" pt 7 ps 1 offset 0,.6 notitle, \
"cha_20260105170428_00_data_count_participants.txt" every ::2008::2008 u 1:2:(bigger($2)) axes x1y2 w labels right tc rgbcolor "#109618" point lc rgbcolor "#109618" pt 7 ps 1 offset 0,.6 notitle, \
"cha_20260105170428_00_data_count_roses.txt" every ::211::211 u 1:2:(bigger($2)) axes x1y2 w labels right tc rgbcolor "#dc3912" point lc rgbcolor "#dc3912" pt 7 ps 1 offset 0,.6 notitle

set output


# L'évolution du nombre de participants du topic

unset multiplot
reset session
reset
set encoding utf8
set locale "fr_FR.utf8"
set decimalsign locale "fr_FR.utf8"
set terminal svg size 1920, 1080 dynamic name "cha_20260105170428_g2_evol_all" font "Verdana,Arial,Sans-serif,Helvetica,14" rounded dashlength 2 linewidth 1 background "#ffffff"
set output "cha_20260105170428_g2_evol_all.svg"
set multiplot title "{/:Bold=18 L'évolution du nombre de participants all time 2025 du topic Charlie Hebdo\n{/:Bold=14 (données collectées le lundi 5 janvier 2026 à 17:04:28)"
set xtics ("2004" 1072915200, "2005" 1104537600, "2006" 1136073600, "2007" 1167609600, "2008" 1199145600, "2009" 1230768000, "2010" 1262304000, "2011" 1293840000, "2012" 1325376000, "2013" 1356998400, "2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200, "2025" 1735689600, "2026" 1767225600, "2027" 1798761600, "2028" 1830297600, "2029" 1861920000) rotate
set ytics 0, 500
set mytics 2
set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
set style fill transparent solid .4
set format y "%'.0f"
set xdata time
set timefmt "%s"
set format x "%F %T"
set mouse mouseformat "DateTime"

set ylabel "{/=16 le nombre de participants"
set key at graph .025, graph .94 top left Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set format y "%'5.0f"

# il faut déterminer k empiriquement, ici k vaut .11
# ensuite on peut choisir la taille des graphs et du titre avec la formule t + 2x + k + x + k = 1
# je donne .06 pour t et k vaut .11 donc x = (1 - .06 - 2 * .11) / 3 = .72 / 3 = .24
set size .985,.59 # 2x + k
set origin .015,.35 # x + k

plot [1142287621:1779479286][0:2108.4] \
"cha_20260105170428_00_data_evol.txt" u 1:2 w lines lw 2 lc rgbcolor "#003fbf" title "le nombre de premières participations", \
"cha_20260105170428_00_data_evol.txt" u 1:3 w lines lw 2 lc rgbcolor "#dc3912" title "le nombre de dernières participations", \
"cha_20260105170428_00_data_evol.txt" u 1:2:3 w filledcurves lw 2 lc rgbcolor "#983fcf" title "le nombre de participants présents   "

set ytics 0, 500
set mytics 2

set ylabel "{/=16 le nombre de participants"
set key at graph .025, graph .88 top left Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set format y "%'5.0f"

set size .985,.35 # x + k
set origin .015,0

plot [1142287621:1779479286][0:1049.4] \
"cha_20260105170428_00_data_evol.txt" u 1:4 w lines lw 2 lc rgbcolor "#983fcf" title "le nombre de participants présents   "

unset multiplot
set output


