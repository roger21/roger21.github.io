

# Le nombre de posts et de participants du topic

unset multiplot
reset session
reset
set encoding utf8
set locale "fr_FR.utf8"
set decimalsign locale "fr_FR.utf8"
set terminal svg size 1920, 1080 dynamic name "lrm_20260106102147_g1_counts_all" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "lrm_20260106102147_g1_counts_all.svg"
set title "{/:Bold=18 Le nombre de posts et de participants all time 2025 du topic LREM\n{/:Bold=14 (données collectées le mardi 6 janvier 2026 à 10:21:47)"
set ylabel "{/=16 le nombre de posts et de smileys"
set y2label "{/=16 le nombre de posts roses et de participants"
set key at graph .025, graph .96 top left Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set xtics ("2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200, "2025" 1735689600, "2026" 1767225600, "2027" 1798761600, "2028" 1830297600, "2029" 1861920000) rotate
set ytics 0, 500000
set mytics 2
set y2tics 0, 1250
set link y2 via y / 400 inverse y * 400
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

plot [1457633917:1773296026][0:1524149.55] \
"lrm_20260106102147_00_data_count_posts.txt" u 1:2 w line lw 2 lc rgbcolor "#003fbf" title "le nombre de posts", \
"lrm_20260106102147_00_data_count_smileys.txt" u 1:2 w line lw 2 lc rgbcolor "#ff9900" title "le nombre de smileys", \
"lrm_20260106102147_00_data_count_participants.txt" u 1:2 axes x1y2 w line lw 2 lc rgbcolor "#109618" title "le nombre de participants (sur y2)", \
"lrm_20260106102147_00_data_count_roses.txt" u 1:2 axes x1y2 w line lw 2 lc rgbcolor "#dc3912" title "le nombre de posts roses (sur y2)", \
"lrm_20260106102147_00_data_count_posts.txt" every ::1451571::1451571 u 1:2:(bigger($2)) w labels right tc rgbcolor "#003fbf" point lc rgbcolor "#003fbf" pt 7 ps 1 offset 0,.6 notitle, \
"lrm_20260106102147_00_data_count_smileys.txt" every ::648155::648155 u 1:2:(bigger($2)) w labels right tc rgbcolor "#ff9900" point lc rgbcolor "#ff9900" pt 7 ps 1 offset 0,.6 notitle, \
"lrm_20260106102147_00_data_count_participants.txt" every ::2808::2808 u 1:2:(bigger($2)) axes x1y2 w labels right tc rgbcolor "#109618" point lc rgbcolor "#109618" pt 7 ps 1 offset 0,.6 notitle, \
"lrm_20260106102147_00_data_count_roses.txt" every ::1444::1444 u 1:2:(bigger($2)) axes x1y2 w labels right tc rgbcolor "#dc3912" point lc rgbcolor "#dc3912" pt 7 ps 1 offset 0,.6 notitle

set output


# L'évolution du nombre de participants du topic

unset multiplot
reset session
reset
set encoding utf8
set locale "fr_FR.utf8"
set decimalsign locale "fr_FR.utf8"
set terminal svg size 1920, 1080 dynamic name "lrm_20260106102147_g2_evol_all" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "lrm_20260106102147_g2_evol_all.svg"
set multiplot title "{/:Bold=18 L'évolution du nombre de participants all time 2025 du topic LREM\n{/:Bold=14 (données collectées le mardi 6 janvier 2026 à 10:21:47)"
set xtics ("2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200, "2025" 1735689600, "2026" 1767225600, "2027" 1798761600, "2028" 1830297600, "2029" 1861920000) rotate
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

plot [1457633917:1773296026][0:2948.4] \
"lrm_20260106102147_00_data_evol.txt" u 1:2 w lines lw 2 lc rgbcolor "#003fbf" title "le nombre de premières participations", \
"lrm_20260106102147_00_data_evol.txt" u 1:3 w lines lw 2 lc rgbcolor "#dc3912" title "le nombre de dernières participations", \
"lrm_20260106102147_00_data_evol.txt" u 1:2:3 w filledcurves lw 2 lc rgbcolor "#983fcf" title "le nombre de participants présents   "

set ytics 0, 500
set mytics 2

set ylabel "{/=16 le nombre de participants"
set key at graph .025, graph .88 top left Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set format y "%'5.0f"

set size .985,.35 # x + k
set origin .015,0

plot [1457633917:1773296026][0:1215.5] \
"lrm_20260106102147_00_data_evol.txt" u 1:4 smooth bezier lw 2 lc rgbcolor "#983fcf" title "le nombre de participants présents   "

unset multiplot
set output


# Le nombre de posts du topic vs le nombre de posts des autres topics politiques

unset multiplot
reset session
reset
set encoding utf8
set locale "fr_FR.utf8"
set decimalsign locale "fr_FR.utf8"
set terminal svg size 1920, 1080 dynamic name "lrm_20260106102147_g3_lrem_versus_politiques" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "lrm_20260106102147_g3_lrem_versus_politiques.svg"
set title "{/:Bold=18 Le topic LREM versus les topics politiques en nombre de posts en 2025\n{/:Bold=14 (données collectées le mardi 6 janvier 2026 à 10:21:47)"
set ylabel "{/=16 le nombre de posts"
set key at graph .025, graph .96 top left Left opaque reverse samplen 3 box spacing 1.2 height .4 width -6
set xtics ("2005" 1104537600, "2006" 1136073600, "2007" 1167609600, "2008" 1199145600, "2009" 1230768000, "2010" 1262304000, "2011" 1293840000, "2012" 1325376000, "2013" 1356998400, "2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200, "2025" 1735689600, "2026" 1767225600, "2027" 1798761600) rotate
set ytics 0, 200000
set mytics 2
set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
set format y "%'.0f"
set xdata time
set timefmt "%s"
set format x "%F %T"
set mouse mouseformat "DateTime"

set size .985,1
set origin .015,0

bigger(s) = sprintf("{/:Bold=16 %'.0f", s)
label_lrem(s) = sprintf("{/:Bold=16 LREM\n{/:Bold=16 %'.0f", s)
label_republicains(s) = sprintf("{/:Bold=16 LR\n{/:Bold=16 %'.0f", s)
label_socialiste(s) = sprintf("{/:Bold=16 %'.0f\n{/:Bold=16 PS", s)
label_lfi(s) = sprintf("{/:Bold=16 LFI\n{/:Bold=16 %'.0f", s)
label_zemmour(s) = sprintf("{/:Bold=16 %'.0f\n{/:Bold=16 Zemmour", s)
label_national(s) = sprintf("{/:Bold=16 RN\n{/:Bold=16 %'.0f", s)
label_modem(s) = sprintf("{/:Bold=16 %'.0f\n{/:Bold=16 MoDem", s)
label_verts(s) = sprintf("{/:Bold=16 EELV\n{/:Bold=16 %'.0f", s)

plot [1104537600:1814400000][0:1600000] \
"lrm_20260106102147_00_data_count_posts_lrem.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#f2d618" title "posts all time du topic LREM", \
"lrm_20260106102147_00_data_count_posts_republicains.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#4363d8" title "posts all time du topic LR", \
"lrm_20260106102147_00_data_count_posts_socialiste.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#f032e6" title "posts all time du topic PS", \
"lrm_20260106102147_00_data_count_posts_lfi.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#e6194b" title "posts all time du topic LFI", \
"lrm_20260106102147_00_data_count_posts_zemmour.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#42d4f4" title "posts all time du topic Zemmour", \
"lrm_20260106102147_00_data_count_posts_national.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#911eb4" title "posts all time du topic RN", \
"lrm_20260106102147_00_data_count_posts_modem.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#f58231" title "posts all time du topic MoDem", \
"lrm_20260106102147_00_data_count_posts_verts.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#3cb44b" title "posts all time du topic EELV", \
"lrm_20260106102147_00_data_count_posts_lrem.txt" every ::1451571::1451571 u 1:2:(label_lrem($2)) w labels left tc rgbcolor "#f2d618" point lc rgbcolor "#f2d618" pt 7 ps 1 offset .7,.3 notitle, \
"lrm_20260106102147_00_data_count_posts_republicains.txt" every ::1072707::1072707 u 1:2:(label_republicains($2)) w labels left tc rgbcolor "#4363d8" point lc rgbcolor "#4363d8" pt 7 ps 1 offset .7,.3 notitle, \
"lrm_20260106102147_00_data_count_posts_socialiste.txt" every ::633809::633809 u 1:2:(label_socialiste($2)) w labels left tc rgbcolor "#f032e6" point lc rgbcolor "#f032e6" pt 7 ps 1 offset .7,.75 notitle, \
"lrm_20260106102147_00_data_count_posts_lfi.txt" every ::578757::578757 u 1:2:(label_lfi($2)) w labels left tc rgbcolor "#e6194b" point lc rgbcolor "#e6194b" pt 7 ps 1 offset .7,-.3 notitle, \
"lrm_20260106102147_00_data_count_posts_zemmour.txt" every ::327033::327033 u 1:2:(label_zemmour($2)) w labels left tc rgbcolor "#42d4f4" point lc rgbcolor "#42d4f4" pt 7 ps 1 offset .7,.75 notitle, \
"lrm_20260106102147_00_data_count_posts_national.txt" every ::284320::284320 u 1:2:(label_national($2)) w labels left tc rgbcolor "#911eb4" point lc rgbcolor "#911eb4" pt 7 ps 1 offset .7,-.3 notitle, \
"lrm_20260106102147_00_data_count_posts_modem.txt" every ::66424::66424 u 1:2:(label_modem($2)) w labels left tc rgbcolor "#f58231" point lc rgbcolor "#f58231" pt 7 ps 1 offset .7,1.25 notitle, \
"lrm_20260106102147_00_data_count_posts_verts.txt" every ::32236::32236 u 1:2:(label_verts($2)) w labels left tc rgbcolor "#3cb44b" point lc rgbcolor "#3cb44b" pt 7 ps 1 offset .7,.3 notitle

set output


