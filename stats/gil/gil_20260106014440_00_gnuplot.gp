

# Le nombre de posts et de participants du topic

unset multiplot
reset session
reset
set encoding utf8
set locale "fr_FR.utf8"
set decimalsign locale "fr_FR.utf8"
set terminal svg size 1920, 1080 dynamic name "gil_20260106014440_g1_counts_all" font "Verdana,Arial,Sans-serif,Helvetica,14" rounded dashlength 2 linewidth 1 background "#ffffff"
set output "gil_20260106014440_g1_counts_all.svg"
set title "{/:Bold=18 Le nombre de posts et de participants all time 2025 du topic des Gilets jaunes\n{/:Bold=14 (données collectées le mardi 6 janvier 2026 à 01:44:40)"
set ylabel "{/=16 le nombre de posts et de smileys"
set y2label "{/=16 le nombre de posts roses et de participants"
set key at graph .025, graph .96 top left Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set xtics ("jan 2016" 1451606400, "feb 2016" 1454284800, "mar 2016" 1456790400, "apr 2016" 1459468800, "may 2016" 1462060800, "jun 2016" 1464739200, "jul 2016" 1467331200, "aug 2016" 1470009600, "sep 2016" 1472688000, "oct 2016" 1475280000, "nov 2016" 1477958400, "dec 2016" 1480550400, "jan 2017" 1483228800, "feb 2017" 1485907200, "mar 2017" 1488326400, "apr 2017" 1491004800, "may 2017" 1493596800, "jun 2017" 1496275200, "jul 2017" 1498867200, "aug 2017" 1501545600, "sep 2017" 1504224000, "oct 2017" 1506816000, "nov 2017" 1509494400, "dec 2017" 1512086400, "jan 2018" 1514764800, "feb 2018" 1517443200, "mar 2018" 1519862400, "apr 2018" 1522540800, "may 2018" 1525132800, "jun 2018" 1527811200, "jul 2018" 1530403200, "aug 2018" 1533081600, "sep 2018" 1535760000, "oct 2018" 1538352000, "nov 2018" 1541030400, "dec 2018" 1543622400, "jan 2019" 1546300800, "feb 2019" 1548979200, "mar 2019" 1551398400, "apr 2019" 1554076800, "may 2019" 1556668800, "jun 2019" 1559347200, "jul 2019" 1561939200, "aug 2019" 1564617600, "sep 2019" 1567296000, "oct 2019" 1569888000, "nov 2019" 1572566400, "dec 2019" 1575158400, "jan 2020" 1577836800, "feb 2020" 1580515200, "mar 2020" 1583020800, "apr 2020" 1585699200, "may 2020" 1588291200, "jun 2020" 1590969600, "jul 2020" 1593561600, "aug 2020" 1596240000, "sep 2020" 1598918400, "oct 2020" 1601510400, "nov 2020" 1604188800, "dec 2020" 1606780800, "jan 2021" 1609459200, "feb 2021" 1612137600, "mar 2021" 1614556800, "apr 2021" 1617235200, "may 2021" 1619827200, "jun 2021" 1622505600, "jul 2021" 1625097600, "aug 2021" 1627776000, "sep 2021" 1630454400, "oct 2021" 1633046400, "nov 2021" 1635724800, "dec 2021" 1638316800, "jan 2022" 1640995200) rotate
set ytics 0, 25000
set mytics 2
set y2tics 0, 500
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

plot [1543158150:1561426515][0:84891.45] \
"gil_20260106014440_00_data_count_posts.txt" u 1:2 w line lw 2 lc rgbcolor "#003fbf" title "le nombre de posts", \
"gil_20260106014440_00_data_count_smileys.txt" u 1:2 w line lw 2 lc rgbcolor "#ff9900" title "le nombre de smileys", \
"gil_20260106014440_00_data_count_participants.txt" u 1:2 axes x1y2 w line lw 2 lc rgbcolor "#109618" title "le nombre de participants (sur y2)", \
"gil_20260106014440_00_data_count_roses.txt" u 1:2 axes x1y2 w line lw 2 lc rgbcolor "#dc3912" title "le nombre de posts roses (sur y2)", \
"gil_20260106014440_00_data_count_posts.txt" every ::80849::80849 u 1:2:(bigger($2)) w labels right tc rgbcolor "#003fbf" point lc rgbcolor "#003fbf" pt 7 ps 1 offset 0,.6 notitle, \
"gil_20260106014440_00_data_count_smileys.txt" every ::39448::39448 u 1:2:(bigger($2)) w labels right tc rgbcolor "#ff9900" point lc rgbcolor "#ff9900" pt 7 ps 1 offset 0,.6 notitle, \
"gil_20260106014440_00_data_count_participants.txt" every ::781::781 u 1:2:(bigger($2)) axes x1y2 w labels right tc rgbcolor "#109618" point lc rgbcolor "#109618" pt 7 ps 1 offset 0,.6 notitle, \
"gil_20260106014440_00_data_count_roses.txt" every ::122::122 u 1:2:(bigger($2)) axes x1y2 w labels right tc rgbcolor "#dc3912" point lc rgbcolor "#dc3912" pt 7 ps 1 offset 0,.6 notitle

set output


# L'évolution du nombre de participants du topic

unset multiplot
reset session
reset
set encoding utf8
set locale "fr_FR.utf8"
set decimalsign locale "fr_FR.utf8"
set terminal svg size 1920, 1080 dynamic name "gil_20260106014440_g2_evol_all" font "Verdana,Arial,Sans-serif,Helvetica,14" rounded dashlength 2 linewidth 1 background "#ffffff"
set output "gil_20260106014440_g2_evol_all.svg"
set multiplot title "{/:Bold=18 L'évolution du nombre de participants all time 2025 du topic des Gilets jaunes\n{/:Bold=14 (données collectées le mardi 6 janvier 2026 à 01:44:40)"
set xtics ("jan 2016" 1451606400, "feb 2016" 1454284800, "mar 2016" 1456790400, "apr 2016" 1459468800, "may 2016" 1462060800, "jun 2016" 1464739200, "jul 2016" 1467331200, "aug 2016" 1470009600, "sep 2016" 1472688000, "oct 2016" 1475280000, "nov 2016" 1477958400, "dec 2016" 1480550400, "jan 2017" 1483228800, "feb 2017" 1485907200, "mar 2017" 1488326400, "apr 2017" 1491004800, "may 2017" 1493596800, "jun 2017" 1496275200, "jul 2017" 1498867200, "aug 2017" 1501545600, "sep 2017" 1504224000, "oct 2017" 1506816000, "nov 2017" 1509494400, "dec 2017" 1512086400, "jan 2018" 1514764800, "feb 2018" 1517443200, "mar 2018" 1519862400, "apr 2018" 1522540800, "may 2018" 1525132800, "jun 2018" 1527811200, "jul 2018" 1530403200, "aug 2018" 1533081600, "sep 2018" 1535760000, "oct 2018" 1538352000, "nov 2018" 1541030400, "dec 2018" 1543622400, "jan 2019" 1546300800, "feb 2019" 1548979200, "mar 2019" 1551398400, "apr 2019" 1554076800, "may 2019" 1556668800, "jun 2019" 1559347200, "jul 2019" 1561939200, "aug 2019" 1564617600, "sep 2019" 1567296000, "oct 2019" 1569888000, "nov 2019" 1572566400, "dec 2019" 1575158400, "jan 2020" 1577836800, "feb 2020" 1580515200, "mar 2020" 1583020800, "apr 2020" 1585699200, "may 2020" 1588291200, "jun 2020" 1590969600, "jul 2020" 1593561600, "aug 2020" 1596240000, "sep 2020" 1598918400, "oct 2020" 1601510400, "nov 2020" 1604188800, "dec 2020" 1606780800, "jan 2021" 1609459200, "feb 2021" 1612137600, "mar 2021" 1614556800, "apr 2021" 1617235200, "may 2021" 1619827200, "jun 2021" 1622505600, "jul 2021" 1625097600, "aug 2021" 1627776000, "sep 2021" 1630454400, "oct 2021" 1633046400, "nov 2021" 1635724800, "dec 2021" 1638316800, "jan 2022" 1640995200) rotate
set ytics 0, 250
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
set format y "%'5.0f"

# il faut déterminer k empiriquement, ici k vaut .11
# ensuite on peut choisir la taille des graphs et du titre avec la formule t + 2x + k + x + k = 1
# je donne .06 pour t et k vaut .11 donc x = (1 - .06 - 2 * .11) / 3 = .72 / 3 = .24
set size .985,.59 # 2x + k
set origin .015,.35 # x + k

plot [1543158150:1561426515][0:820.05] \
"gil_20260106014440_00_data_evol.txt" u 1:2 w lines lw 2 lc rgbcolor "#003fbf" title "le nombre de premières participations", \
"gil_20260106014440_00_data_evol.txt" u 1:3 w lines lw 2 lc rgbcolor "#dc3912" title "le nombre de dernières participations", \
"gil_20260106014440_00_data_evol.txt" u 1:2:3 w filledcurves lw 2 lc rgbcolor "#983fcf" title "le nombre de participants présents   "

set ytics 0, 100
set mytics 2

set ylabel "{/=16 le nombre de participants"
set key at graph .975, graph .88 top right Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set format y "%'5.0f"

set size .985,.35 # x + k
set origin .015,0

plot [1543158150:1561426515][0:385] \
"gil_20260106014440_00_data_evol.txt" u 1:4 w lines lw 2 lc rgbcolor "#983fcf" title "le nombre de participants présents   "

unset multiplot
set output


