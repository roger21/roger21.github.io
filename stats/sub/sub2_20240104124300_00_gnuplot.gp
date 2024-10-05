

# Le nombre de posts et de participants du topic

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "sub2_20240104124300_g1_counts_all" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "sub2_20240104124300_g1_counts_all.svg"
set title "{/:Bold=18 Le nombre de posts et de participants all time 2023 du topic submersible disparu\n{/:Bold=14 (données collectées le jeudi 4 janvier 2024 à 12:43:00)"
set ylabel "{/=16 le nombre de posts et de smileys"
set y2label "{/=16 le nombre de posts roses et de participants"
set key at graph .975, graph .2 bottom right Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set xtics ("jan 2021" 1609459200, "feb 2021" 1612137600, "mar 2021" 1614556800, "apr 2021" 1617235200, "may 2021" 1619827200, "jun 2021" 1622505600, "jul 2021" 1625097600, "aug 2021" 1627776000, "sep 2021" 1630454400, "oct 2021" 1633046400, "nov 2021" 1635724800, "dec 2021" 1638316800, "jan 2022" 1640995200, "feb 2022" 1643673600, "mar 2022" 1646092800, "apr 2022" 1648771200, "may 2022" 1651363200, "jun 2022" 1654041600, "jul 2022" 1656633600, "aug 2022" 1659312000, "sep 2022" 1661990400, "oct 2022" 1664582400, "nov 2022" 1667260800, "dec 2022" 1669852800, "jan 2023" 1672531200, "feb 2023" 1675209600, "mar 2023" 1677628800, "apr 2023" 1680307200, "may 2023" 1682899200, "jun 2023" 1685577600, "jul 2023" 1688169600, "aug 2023" 1690848000, "sep 2023" 1693526400, "oct 2023" 1696118400, "nov 2023" 1698796800, "dec 2023" 1701388800, "jan 2024" 1704067200, "feb 2024" 1706745600, "mar 2024" 1709251200, "apr 2024" 1711929600, "may 2024" 1714521600, "jun 2024" 1717200000, "jul 2024" 1719792000, "aug 2024" 1722470400, "sep 2024" 1725148800, "oct 2024" 1727740800, "nov 2024" 1730419200, "dec 2024" 1733011200, "jan 2025" 1735689600, "feb 2025" 1738368000, "mar 2025" 1740787200, "apr 2025" 1743465600, "may 2025" 1746057600, "jun 2025" 1748736000, "jul 2025" 1751328000, "aug 2025" 1754006400, "sep 2025" 1756684800, "oct 2025" 1759276800, "nov 2025" 1761955200, "dec 2025" 1764547200, "jan 2026" 1767225600, "feb 2026" 1769904000, "mar 2026" 1772323200, "apr 2026" 1775001600, "may 2026" 1777593600, "jun 2026" 1780272000, "jul 2026" 1782864000, "aug 2026" 1785542400, "sep 2026" 1788220800, "oct 2026" 1790812800, "nov 2026" 1793491200, "dec 2026" 1796083200, "jan 2027" 1798761600) rotate
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

plot [1686929906:1704403226][0:3294.9] \
"sub2_20240104124300_00_data_count_posts.txt" u 1:2 w line lw 2 lc rgbcolor "#003fbf" title "le nombre de posts", \
"sub2_20240104124300_00_data_count_smileys.txt" u 1:2 w line lw 2 lc rgbcolor "#ff9900" title "le nombre de smileys", \
"sub2_20240104124300_00_data_count_participants.txt" u 1:2 axes x1y2 w line lw 2 lc rgbcolor "#109618" title "le nombre de participants (sur y2)", \
"sub2_20240104124300_00_data_count_roses.txt" u 1:2 axes x1y2 w line lw 2 lc rgbcolor "#dc3912" title "le nombre de posts roses (sur y2)", \
"sub2_20240104124300_00_data_count_posts.txt" every ::3138::3138 u 1:2:(bigger($2)) w labels right tc rgbcolor "#003fbf" point lc rgbcolor "#003fbf" pt 7 ps 1 offset 0,.6 notitle, \
"sub2_20240104124300_00_data_count_smileys.txt" every ::1415::1415 u 1:2:(bigger($2)) w labels right tc rgbcolor "#ff9900" point lc rgbcolor "#ff9900" pt 7 ps 1 offset 0,.6 notitle, \
"sub2_20240104124300_00_data_count_participants.txt" every ::271::271 u 1:2:(bigger($2)) axes x1y2 w labels right tc rgbcolor "#109618" point lc rgbcolor "#109618" pt 7 ps 1 offset 0,.6 notitle, \
"sub2_20240104124300_00_data_count_roses.txt" every ::2::2 u 1:2:(bigger($2)) axes x1y2 w labels right tc rgbcolor "#dc3912" point lc rgbcolor "#dc3912" pt 7 ps 1 offset 0,.6 notitle

set output


# L'évolution du nombre de participants du topic

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "sub2_20240104124300_g2_evol_all" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "sub2_20240104124300_g2_evol_all.svg"
set multiplot title "{/:Bold=18 L'évolution du nombre de participants all time 2023 du topic submersible disparu\n{/:Bold=14 (données collectées le jeudi 4 janvier 2024 à 12:43:00)"
set xtics ("jan 2021" 1609459200, "feb 2021" 1612137600, "mar 2021" 1614556800, "apr 2021" 1617235200, "may 2021" 1619827200, "jun 2021" 1622505600, "jul 2021" 1625097600, "aug 2021" 1627776000, "sep 2021" 1630454400, "oct 2021" 1633046400, "nov 2021" 1635724800, "dec 2021" 1638316800, "jan 2022" 1640995200, "feb 2022" 1643673600, "mar 2022" 1646092800, "apr 2022" 1648771200, "may 2022" 1651363200, "jun 2022" 1654041600, "jul 2022" 1656633600, "aug 2022" 1659312000, "sep 2022" 1661990400, "oct 2022" 1664582400, "nov 2022" 1667260800, "dec 2022" 1669852800, "jan 2023" 1672531200, "feb 2023" 1675209600, "mar 2023" 1677628800, "apr 2023" 1680307200, "may 2023" 1682899200, "jun 2023" 1685577600, "jul 2023" 1688169600, "aug 2023" 1690848000, "sep 2023" 1693526400, "oct 2023" 1696118400, "nov 2023" 1698796800, "dec 2023" 1701388800, "jan 2024" 1704067200, "feb 2024" 1706745600, "mar 2024" 1709251200, "apr 2024" 1711929600, "may 2024" 1714521600, "jun 2024" 1717200000, "jul 2024" 1719792000, "aug 2024" 1722470400, "sep 2024" 1725148800, "oct 2024" 1727740800, "nov 2024" 1730419200, "dec 2024" 1733011200, "jan 2025" 1735689600, "feb 2025" 1738368000, "mar 2025" 1740787200, "apr 2025" 1743465600, "may 2025" 1746057600, "jun 2025" 1748736000, "jul 2025" 1751328000, "aug 2025" 1754006400, "sep 2025" 1756684800, "oct 2025" 1759276800, "nov 2025" 1761955200, "dec 2025" 1764547200, "jan 2026" 1767225600, "feb 2026" 1769904000, "mar 2026" 1772323200, "apr 2026" 1775001600, "may 2026" 1777593600, "jun 2026" 1780272000, "jul 2026" 1782864000, "aug 2026" 1785542400, "sep 2026" 1788220800, "oct 2026" 1790812800, "nov 2026" 1793491200, "dec 2026" 1796083200, "jan 2027" 1798761600) rotate
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

plot [1686929906:1704403226][0:284.55] \
"sub2_20240104124300_00_data_evol.txt" u 1:2 w lines lw 2 lc rgbcolor "#003fbf" title "le nombre de premières participations", \
"sub2_20240104124300_00_data_evol.txt" u 1:3 w lines lw 2 lc rgbcolor "#dc3912" title "le nombre de dernières participations", \
"sub2_20240104124300_00_data_evol.txt" u 1:2:3 w filledcurves lw 2 lc rgbcolor "#983fcf" title "le nombre de participants présents   "

set ytics 0, 50
set mytics 2

set ylabel "{/=16 le nombre de participants"
set key at graph .975, graph .88 top right Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set format y "%'4.0f"

set size .985,.35 # x + k
set origin .015,0

plot [1686929906:1704403226][0:140.8] \
"sub2_20240104124300_00_data_evol.txt" u 1:4 smooth bezier lw 2 lc rgbcolor "#983fcf" title "le nombre de participants présents   "

unset multiplot
set output


