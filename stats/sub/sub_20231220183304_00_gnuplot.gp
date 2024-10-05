

# Le nombre de posts et de participants du topic

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "sub_20231220183304_01_counts_all" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "sub_20231220183304_01_counts_all.svg"
set title "{/:Bold=18 Le nombre de posts et de participants all time du topic submersible disparu\n{/:Bold=14 (données collectées le mercredi 20 décembre 2023 à 18:33:04)"
set ylabel "{/=16 le nombre de posts"
set y2label "{/=16 le nombre de posts roses et de participants"
set key at graph .025, graph .96 top left Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set xtics ("jan 2022" 1640995200, "feb 2022" 1643673600, "mar 2022" 1646092800, "apr 2022" 1648771200, "may 2022" 1651363200, "jun 2022" 1654041600, "jul 2022" 1656633600, "aug 2022" 1659312000, "sep 2022" 1661990400, "oct 2022" 1664582400, "nov 2022" 1667260800, "dec 2022" 1669852800, "jan 2023" 1672531200, "feb 2023" 1675209600, "mar 2023" 1677628800, "apr 2023" 1680307200, "may 2023" 1682899200, "jun 2023" 1685577600, "jul 2023" 1688169600, "aug 2023" 1690848000, "sep 2023" 1693526400, "oct 2023" 1696118400, "nov 2023" 1698796800, "dec 2023" 1701388800, "jan 2024" 1704067200, "feb 2024" 1706745600, "mar 2024" 1709251200, "apr 2024" 1711929600, "may 2024" 1714521600, "jun 2024" 1717200000, "jul 2024" 1719792000, "aug 2024" 1722470400, "sep 2024" 1725148800, "oct 2024" 1727740800, "nov 2024" 1730419200, "dec 2024" 1733011200, "jan 2025" 1735689600) rotate
set ytics 0, 1000
set mytics 2
set y2tics 0, 100
set link y2 via y / 10 inverse y * 10
set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
set format y "%'.0f"
set format y2 "%'.0f"
set xdata time
set timefmt "%s"
set format x "%F %T"
set mouse mouseformat "DateTime"

set size .985,1
set origin .015,0

bigger(s) = sprintf("{/:Bold=16 %.f", s)

plot [1684540800:1705708800][0:4000] \
"sub_20231220183304_00_data_count_posts.txt" u 1:2 w line lw 2 lc rgbcolor "#ff7f00" title "le nombre de posts", \
"sub_20231220183304_00_data_count_participants.txt" u 1:2 axes x1y2 w line lw 2 lc rgbcolor "#7f5fff" title "le nombre de participants (sur y2)", \
"sub_20231220183304_00_data_count_roses.txt" u 1:2 axes x1y2 w line lw 2 lc rgbcolor "#3faf3f" title "le nombre de posts roses (sur y2)", \
"sub_20231220183304_00_data_count_posts.txt" every ::3137::3137 u 1:2:(bigger($2)) w labels right tc rgbcolor "#ff7f00" point lc rgbcolor "#ff7f00" pt 7 ps 1 offset 0,.6 notitle, \
"sub_20231220183304_00_data_count_participants.txt" every ::270::270 u 1:2:(bigger($2)) axes x1y2 w labels right tc rgbcolor "#7f5fff" point lc rgbcolor "#7f5fff" pt 7 ps 1 offset 0,.6 notitle, \
"sub_20231220183304_00_data_count_roses.txt" every ::1::1 u 1:2:(bigger($2)) axes x1y2 w labels right tc rgbcolor "#3faf3f" point lc rgbcolor "#3faf3f" pt 7 ps 1 offset 0,.6 notitle

set output


# L'évolution du nombre de participants du topic

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "sub_20231220183304_02_evol_all" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "sub_20231220183304_02_evol_all.svg"
set multiplot title "{/:Bold=18 L'évolution du nombre de participants all time du topic submersible disparu\n{/:Bold=14 (données collectées le mercredi 20 décembre 2023 à 18:33:04)"
set xtics ("jan 2022" 1640995200, "feb 2022" 1643673600, "mar 2022" 1646092800, "apr 2022" 1648771200, "may 2022" 1651363200, "jun 2022" 1654041600, "jul 2022" 1656633600, "aug 2022" 1659312000, "sep 2022" 1661990400, "oct 2022" 1664582400, "nov 2022" 1667260800, "dec 2022" 1669852800, "jan 2023" 1672531200, "feb 2023" 1675209600, "mar 2023" 1677628800, "apr 2023" 1680307200, "may 2023" 1682899200, "jun 2023" 1685577600, "jul 2023" 1688169600, "aug 2023" 1690848000, "sep 2023" 1693526400, "oct 2023" 1696118400, "nov 2023" 1698796800, "dec 2023" 1701388800, "jan 2024" 1704067200, "feb 2024" 1706745600, "mar 2024" 1709251200, "apr 2024" 1711929600, "may 2024" 1714521600, "jun 2024" 1717200000, "jul 2024" 1719792000, "aug 2024" 1722470400, "sep 2024" 1725148800, "oct 2024" 1727740800, "nov 2024" 1730419200, "dec 2024" 1733011200, "jan 2025" 1735689600) rotate
set ytics 0, 50
set mytics 2
set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
set style fill transparent solid .4
set format y "%'.0f"
set xdata time
set timefmt "%s"
set format x "%F %T"
set mouse mouseformat "DateTime"

set ylabel "{/=16 le nombre de participants"
set key at graph .975, graph .06 bottom right Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set format y "%'4.0f"

# il faut déterminer k empiriquement, ici k vaut .11
# ensuite on peut choisir la taille des graphs et du titre avec la formule t + 2x + k + x + k = 1
# je donne .06 pour t et k vaut .11 donc x = (1 - .06 - 2 * .11) / 3 = .72 / 3 = .24
set size .985,.59 # 2x + k
set origin .015,.35 # x + k

plot [1684540800:1705708800][0:300] \
"sub_20231220183304_00_data_evol.txt" u 1:2 w lines lw 2 lc rgbcolor "#003fbf" title "le nombre de premières participations", \
"sub_20231220183304_00_data_evol.txt" u 1:3 w lines lw 2 lc rgbcolor "#bf3f3f" title "le nombre de dernières participations", \
"sub_20231220183304_00_data_evol.txt" u 1:2:3 w filledcurves lw 2 lc rgbcolor "#7f3fff" title "le nombre de participants présents   "

set ylabel "{/=16 le nombre de participants"
set key at graph .975, graph .88 top right Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set format y "%'4.0f"

set size .985,.35 # x + k
set origin .015,0

plot [1684540800:1705708800][0:150] \
"sub_20231220183304_00_data_evol.txt" u 1:4 smooth bezier lw 2 lc rgbcolor "#7f3fff" title "le nombre de participants présents   "

unset multiplot
set output


# # L'activité du topic par an

# unset multiplot
# reset session
# reset
# #set locale "french"
# set encoding utf8
# set terminal svg size 1920, 1080 dynamic name "sub_20231220183304_03_activite_all_year" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
# set output "sub_20231220183304_03_activite_all_year.svg"
# set title "{/:Bold=18 L'activité all time par an du topic submersible disparu\n{/:Bold=14 (données collectées le mercredi 20 décembre 2023 à 18:33:04)"
# set ylabel "{/=16 le nombre de posts par an"
# set y2label "{/=16 le nombre de posts roses et de participants par an"
# set key at graph .025, graph .96 top left Left opaque reverse samplen 3 box spacing 1.2 height .5 width -10
# set xtics ("2022" 1640995200, "2023" 1672531200, "2024" 1704067200, "2025" 1735689600) rotate
# set ytics 0, 1000
# set mytics 2
# set y2tics 0, 100
# set link y2 via y / 10 inverse y * 10
# set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
# set style fill transparent solid .4 noborder
# set format y "%'.0f"
# set format y2 "%'.0f"
# set xdata time
# set timefmt "%s"
# set format x "%F %T"
# set mouse mouseformat "DateTime"

# set size .985,1
# set origin .015,0

# plot [1669852800:1675209600][0:3500] \
# "sub_20231220183304_00_data_activite_year.txt" u 1:2 w lines lw 2 lc rgbcolor "#ff7f00" title "le nombre de posts par an", \
# "sub_20231220183304_00_data_activite_year.txt" u 1:4 axes x1y2 w lines lw 2 lc rgbcolor "#7f5fff" title "le nombre de participants par an (sur y2)", \
# "sub_20231220183304_00_data_activite_year.txt" u 1:4:($4-$5) axes x1y2 w filledcurves lw 2 lc rgbcolor "#9f9fff" title "le nombre de nouveaux participants par an (sur y2)", \
# "sub_20231220183304_00_data_activite_year.txt" u 1:3 axes x1y2 w lines lw 2 lc rgbcolor "#3faf3f" title "le nombre de posts roses par an (sur y2)"

# set output


# L'activité du topic par mois

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "sub_20231220183304_04_activite_all_month" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "sub_20231220183304_04_activite_all_month.svg"
set title "{/:Bold=18 L'activité all time par mois du topic submersible disparu\n{/:Bold=14 (données collectées le mercredi 20 décembre 2023 à 18:33:04)"
set ylabel "{/=16 le nombre de posts par mois"
set y2label "{/=16 le nombre de posts roses et de participants par mois"
set key at graph .975, graph .96 top right Left opaque reverse samplen 3 box spacing 1.2 height .5 width -12
set xtics ("jan 2022" 1640995200, "feb 2022" 1643673600, "mar 2022" 1646092800, "apr 2022" 1648771200, "may 2022" 1651363200, "jun 2022" 1654041600, "jul 2022" 1656633600, "aug 2022" 1659312000, "sep 2022" 1661990400, "oct 2022" 1664582400, "nov 2022" 1667260800, "dec 2022" 1669852800, "jan 2023" 1672531200, "feb 2023" 1675209600, "mar 2023" 1677628800, "apr 2023" 1680307200, "may 2023" 1682899200, "jun 2023" 1685577600, "jul 2023" 1688169600, "aug 2023" 1690848000, "sep 2023" 1693526400, "oct 2023" 1696118400, "nov 2023" 1698796800, "dec 2023" 1701388800, "jan 2024" 1704067200, "feb 2024" 1706745600, "mar 2024" 1709251200, "apr 2024" 1711929600, "may 2024" 1714521600, "jun 2024" 1717200000, "jul 2024" 1719792000, "aug 2024" 1722470400, "sep 2024" 1725148800, "oct 2024" 1727740800, "nov 2024" 1730419200, "dec 2024" 1733011200, "jan 2025" 1735689600) rotate
set ytics 0, 1000
set mytics 2
set y2tics 0, 100
set link y2 via y / 10 inverse y * 10
set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
set style fill transparent solid .4 noborder
set format y "%'.0f"
set format y2 "%'.0f"
set xdata time
set timefmt "%s"
set format x "%F %T"
set mouse mouseformat "DateTime"

set size .985,1
set origin .015,0

plot [1682899200:1704067200][0:3000] \
"sub_20231220183304_00_data_activite_month.txt" u 1:2 w lines lw 2 lc rgbcolor "#ff7f00" title "le nombre de posts par mois", \
"sub_20231220183304_00_data_activite_month.txt" u 1:4 axes x1y2 w lines lw 2 lc rgbcolor "#7f5fff" title "le nombre de participants par mois (sur y2)", \
"sub_20231220183304_00_data_activite_month.txt" u 1:4:($4-$5) axes x1y2 w filledcurves lw 2 lc rgbcolor "#9f9fff" title "le nombre de nouveaux participants par mois (sur y2)", \
"sub_20231220183304_00_data_activite_month.txt" u 1:3 axes x1y2 w lines lw 2 lc rgbcolor "#3faf3f" title "le nombre de posts roses par mois (sur y2)"

set output


# L'activité du topic par semaine

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "sub_20231220183304_05_activite_all_week" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "sub_20231220183304_05_activite_all_week.svg"
set title "{/:Bold=18 L'activité all time par semaine du topic submersible disparu\n{/:Bold=14 (données collectées le mercredi 20 décembre 2023 à 18:33:04)"
set ylabel "{/=16 le nombre de posts par semaine"
set y2label "{/=16 le nombre de posts roses et de participants par semaine"
set key at graph .975, graph .96 top right Left opaque reverse samplen 3 box spacing 1.2 height .5 width -12
set xtics ("jan 2022" 1640995200, "feb 2022" 1643673600, "mar 2022" 1646092800, "apr 2022" 1648771200, "may 2022" 1651363200, "jun 2022" 1654041600, "jul 2022" 1656633600, "aug 2022" 1659312000, "sep 2022" 1661990400, "oct 2022" 1664582400, "nov 2022" 1667260800, "dec 2022" 1669852800, "jan 2023" 1672531200, "feb 2023" 1675209600, "mar 2023" 1677628800, "apr 2023" 1680307200, "may 2023" 1682899200, "jun 2023" 1685577600, "jul 2023" 1688169600, "aug 2023" 1690848000, "sep 2023" 1693526400, "oct 2023" 1696118400, "nov 2023" 1698796800, "dec 2023" 1701388800, "jan 2024" 1704067200, "feb 2024" 1706745600, "mar 2024" 1709251200, "apr 2024" 1711929600, "may 2024" 1714521600, "jun 2024" 1717200000, "jul 2024" 1719792000, "aug 2024" 1722470400, "sep 2024" 1725148800, "oct 2024" 1727740800, "nov 2024" 1730419200, "dec 2024" 1733011200, "jan 2025" 1735689600) rotate
set ytics 0, 1000
set mytics 2
set y2tics 0, 100
set link y2 via y / 10 inverse y * 10
set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
set style fill transparent solid .4 noborder
set format y "%'.0f"
set format y2 "%'.0f"
set xdata time
set timefmt "%s"
set format x "%F %T"
set mouse mouseformat "DateTime"

set size .985,1
set origin .015,0

plot [1684454400:1705536000][0:3000] \
"sub_20231220183304_00_data_activite_week.txt" u 1:2 w lines lw 2 lc rgbcolor "#ff7f00" title "le nombre de posts par semaine", \
"sub_20231220183304_00_data_activite_week.txt" u 1:4 axes x1y2 w lines lw 2 lc rgbcolor "#7f5fff" title "le nombre de participants par semaine (sur y2)", \
"sub_20231220183304_00_data_activite_week.txt" u 1:4:($4-$5) axes x1y2 w filledcurves lw 2 lc rgbcolor "#9f9fff" title "le nombre de nouveaux participants par semaine (sur y2)", \
"sub_20231220183304_00_data_activite_week.txt" u 1:3 axes x1y2 w lines lw 2 lc rgbcolor "#3faf3f" title "le nombre de posts roses par semaine (sur y2)"

set output


# L'activité du topic par jour

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "sub_20231220183304_06_activite_all_day" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "sub_20231220183304_06_activite_all_day.svg"
set title "{/:Bold=18 L'activité all time par jour du topic submersible disparu\n{/:Bold=14 (données collectées le mercredi 20 décembre 2023 à 18:33:04)"
set ylabel "{/=16 le nombre de posts par jour"
set y2label "{/=16 le nombre de posts roses et de participants par jour"
set key at graph .975, graph .96 top right Left opaque reverse samplen 3 box spacing 1.2 height .5 width -12
set xtics ("jan 2022" 1640995200, "feb 2022" 1643673600, "mar 2022" 1646092800, "apr 2022" 1648771200, "may 2022" 1651363200, "jun 2022" 1654041600, "jul 2022" 1656633600, "aug 2022" 1659312000, "sep 2022" 1661990400, "oct 2022" 1664582400, "nov 2022" 1667260800, "dec 2022" 1669852800, "jan 2023" 1672531200, "feb 2023" 1675209600, "mar 2023" 1677628800, "apr 2023" 1680307200, "may 2023" 1682899200, "jun 2023" 1685577600, "jul 2023" 1688169600, "aug 2023" 1690848000, "sep 2023" 1693526400, "oct 2023" 1696118400, "nov 2023" 1698796800, "dec 2023" 1701388800, "jan 2024" 1704067200, "feb 2024" 1706745600, "mar 2024" 1709251200, "apr 2024" 1711929600, "may 2024" 1714521600, "jun 2024" 1717200000, "jul 2024" 1719792000, "aug 2024" 1722470400, "sep 2024" 1725148800, "oct 2024" 1727740800, "nov 2024" 1730419200, "dec 2024" 1733011200, "jan 2025" 1735689600) rotate
set ytics 0, 500
set mytics 2
set y2tics 0, 100
set link y2 via y / 5 inverse y * 5
set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
set style fill transparent solid .4 noborder
set format y "%'.0f"
set format y2 "%'.0f"
set xdata time
set timefmt "%s"
set format x "%F %T"
set mouse mouseformat "DateTime"

set size .985,1
set origin .015,0

plot [1684540800:1705708800][0:1500] \
"sub_20231220183304_00_data_activite_day.txt" u 1:2 w lines lw 2 lc rgbcolor "#ff7f00" title "le nombre de posts par jour", \
"sub_20231220183304_00_data_activite_day.txt" u 1:4 axes x1y2 w lines lw 2 lc rgbcolor "#7f5fff" title "le nombre de participants par jour (sur y2)", \
"sub_20231220183304_00_data_activite_day.txt" u 1:4:($4-$5) axes x1y2 w filledcurves lw 2 lc rgbcolor "#9f9fff" title "le nombre de nouveaux participants par jour (sur y2)", \
"sub_20231220183304_00_data_activite_day.txt" u 1:3 axes x1y2 w lines lw 2 lc rgbcolor "#3faf3f" title "le nombre de posts roses par jour (sur y2)"

set output


