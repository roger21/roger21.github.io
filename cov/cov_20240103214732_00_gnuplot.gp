

# Le nombre de posts et de participants du topic

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "cov_20240103214732_01_counts_all" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "cov_20240103214732_01_counts_all.svg"
set title "{/:Bold=18 Le nombre de posts et de participants all time du topic COVID-19\n{/:Bold=14 (données collectées le mercredi 3 janvier 2024 à 21:47:32)"
set ylabel "{/=16 le nombre de posts"
set y2label "{/=16 le nombre de posts roses et de participants"
set key at graph .025, graph .96 top left Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set xtics ("jan 2019" 1546300800, "jul 2019" 1561939200, "jan 2020" 1577836800, "jul 2020" 1593561600, "jan 2021" 1609459200, "jul 2021" 1625097600, "jan 2022" 1640995200, "jul 2022" 1656633600, "jan 2023" 1672531200, "jul 2023" 1688169600, "jan 2024" 1704067200, "jul 2024" 1719792000, "jan 2025" 1735689600, "jul 2025" 1751328000, "jan 2026" 1767225600) rotate
set ytics 0, 200000
set mytics 2
set y2tics 0, 1000
set link y2 via y / 200 inverse y * 200
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

plot [1576886400:1706918400][0:1000000] \
"cov_20240103214732_00_data_count_posts.txt" u 1:2 w line lw 2 lc rgbcolor "#ff7f00" title "le nombre de posts", \
"cov_20240103214732_00_data_count_participants.txt" u 1:2 axes x1y2 w line lw 2 lc rgbcolor "#7f5fff" title "le nombre de participants (sur y2)", \
"cov_20240103214732_00_data_count_roses.txt" u 1:2 axes x1y2 w line lw 2 lc rgbcolor "#3faf3f" title "le nombre de posts roses (sur y2)", \
"cov_20240103214732_00_data_count_posts.txt" every ::987034::987034 u 1:2:(bigger($2)) w labels right tc rgbcolor "#ff7f00" point lc rgbcolor "#ff7f00" pt 7 ps 1 offset 0,-1.2 notitle, \
"cov_20240103214732_00_data_count_participants.txt" every ::3459::3459 u 1:2:(bigger($2)) axes x1y2 w labels right tc rgbcolor "#7f5fff" point lc rgbcolor "#7f5fff" pt 7 ps 1 offset 0,-1.2 notitle, \
"cov_20240103214732_00_data_count_roses.txt" every ::1207::1207 u 1:2:(bigger($2)) axes x1y2 w labels right tc rgbcolor "#3faf3f" point lc rgbcolor "#3faf3f" pt 7 ps 1 offset 0,-1.2 notitle

set output


# L'évolution du nombre de participants du topic

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "cov_20240103214732_02_evol_all" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "cov_20240103214732_02_evol_all.svg"
set multiplot title "{/:Bold=18 L'évolution du nombre de participants all time du topic COVID-19\n{/:Bold=14 (données collectées le mercredi 3 janvier 2024 à 21:47:32)"
set xtics ("jan 2019" 1546300800, "jul 2019" 1561939200, "jan 2020" 1577836800, "jul 2020" 1593561600, "jan 2021" 1609459200, "jul 2021" 1625097600, "jan 2022" 1640995200, "jul 2022" 1656633600, "jan 2023" 1672531200, "jul 2023" 1688169600, "jan 2024" 1704067200, "jul 2024" 1719792000, "jan 2025" 1735689600, "jul 2025" 1751328000, "jan 2026" 1767225600) rotate
set ytics 0, 1000
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

plot [1576886400:1706918400][0:4000] \
"cov_20240103214732_00_data_evol.txt" u 1:2 w lines lw 2 lc rgbcolor "#003fbf" title "le nombre de premières participations", \
"cov_20240103214732_00_data_evol.txt" u 1:3 w lines lw 2 lc rgbcolor "#bf3f3f" title "le nombre de dernières participations", \
"cov_20240103214732_00_data_evol.txt" u 1:2:3 w filledcurves lw 2 lc rgbcolor "#7f3fff" title "le nombre de participants présents   "

set ylabel "{/=16 le nombre de participants"
set key at graph .975, graph .88 top right Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set format y "%'4.0f"

set size .985,.35 # x + k
set origin .015,0

plot [1576886400:1706918400][0:2000] \
"cov_20240103214732_00_data_evol.txt" u 1:4 smooth bezier lw 2 lc rgbcolor "#7f3fff" title "le nombre de participants présents   "

unset multiplot
set output


# L'activité du topic par an

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "cov_20240103214732_03_activite_all_year" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "cov_20240103214732_03_activite_all_year.svg"
set title "{/:Bold=18 L'activité all time par an du topic COVID-19\n{/:Bold=14 (données collectées le mercredi 3 janvier 2024 à 21:47:32)"
set ylabel "{/=16 le nombre de posts par an"
set y2label "{/=16 le nombre de posts roses et de participants par an"
set key at graph .975, graph .96 top right Left opaque reverse samplen 3 box spacing 1.2 height .5 width -10
set xtics ("2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200, "2025" 1735689600, "2026" 1767225600) rotate
set ytics 0, 100000
set mytics 2
set y2tics 0, 500
set link y2 via y / 200 inverse y * 200
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

plot [1575158400:1706745600][0:600000] \
"cov_20240103214732_00_data_activite_year.txt" u 1:2 w lines lw 2 lc rgbcolor "#ff7f00" title "le nombre de posts par an", \
"cov_20240103214732_00_data_activite_year.txt" u 1:4 axes x1y2 w lines lw 2 lc rgbcolor "#7f5fff" title "le nombre de participants par an (sur y2)", \
"cov_20240103214732_00_data_activite_year.txt" u 1:4:($4-$5) axes x1y2 w filledcurves lw 2 lc rgbcolor "#9f9fff" title "le nombre de nouveaux participants par an (sur y2)", \
"cov_20240103214732_00_data_activite_year.txt" u 1:3 axes x1y2 w lines lw 2 lc rgbcolor "#3faf3f" title "le nombre de posts roses par an (sur y2)"

set output


# L'activité du topic par mois

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "cov_20240103214732_04_activite_all_month" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "cov_20240103214732_04_activite_all_month.svg"
set title "{/:Bold=18 L'activité all time par mois du topic COVID-19\n{/:Bold=14 (données collectées le mercredi 3 janvier 2024 à 21:47:32)"
set ylabel "{/=16 le nombre de posts par mois"
set y2label "{/=16 le nombre de posts roses et de participants par mois"
set key at graph .975, graph .96 top right Left opaque reverse samplen 3 box spacing 1.2 height .5 width -10
set xtics ("jan 2019" 1546300800, "jul 2019" 1561939200, "jan 2020" 1577836800, "jul 2020" 1593561600, "jan 2021" 1609459200, "jul 2021" 1625097600, "jan 2022" 1640995200, "jul 2022" 1656633600, "jan 2023" 1672531200, "jul 2023" 1688169600, "jan 2024" 1704067200, "jul 2024" 1719792000, "jan 2025" 1735689600, "jul 2025" 1751328000, "jan 2026" 1767225600) rotate
set ytics 0, 40000
set mytics 2
set y2tics 0, 1000
set link y2 via y / 40 inverse y * 40
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

plot [1575158400:1706745600][0:160000] \
"cov_20240103214732_00_data_activite_month.txt" u 1:2 w lines lw 2 lc rgbcolor "#ff7f00" title "le nombre de posts par mois", \
"cov_20240103214732_00_data_activite_month.txt" u 1:4 axes x1y2 w lines lw 2 lc rgbcolor "#7f5fff" title "le nombre de participants par mois (sur y2)", \
"cov_20240103214732_00_data_activite_month.txt" u 1:4:($4-$5) axes x1y2 w filledcurves lw 2 lc rgbcolor "#9f9fff" title "le nombre de nouveaux participants par mois (sur y2)", \
"cov_20240103214732_00_data_activite_month.txt" u 1:3 axes x1y2 w lines lw 2 lc rgbcolor "#3faf3f" title "le nombre de posts roses par mois (sur y2)"

set output


# L'activité du topic par semaine

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "cov_20240103214732_05_activite_all_week" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "cov_20240103214732_05_activite_all_week.svg"
set title "{/:Bold=18 L'activité all time par semaine du topic COVID-19\n{/:Bold=14 (données collectées le mercredi 3 janvier 2024 à 21:47:32)"
set ylabel "{/=16 le nombre de posts par semaine"
set y2label "{/=16 le nombre de posts roses et de participants par semaine"
set key at graph .975, graph .96 top right Left opaque reverse samplen 3 box spacing 1.2 height .5 width -10
set xtics ("jan 2019" 1546300800, "jul 2019" 1561939200, "jan 2020" 1577836800, "jul 2020" 1593561600, "jan 2021" 1609459200, "jul 2021" 1625097600, "jan 2022" 1640995200, "jul 2022" 1656633600, "jan 2023" 1672531200, "jul 2023" 1688169600, "jan 2024" 1704067200, "jul 2024" 1719792000, "jan 2025" 1735689600, "jul 2025" 1751328000, "jan 2026" 1767225600) rotate
set ytics 0, 10000
set mytics 2
set y2tics 0, 500
set link y2 via y / 20 inverse y * 20
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

plot [1576800000:1706745600][0:50000] \
"cov_20240103214732_00_data_activite_week.txt" u 1:2 w lines lw 2 lc rgbcolor "#ff7f00" title "le nombre de posts par semaine", \
"cov_20240103214732_00_data_activite_week.txt" u 1:4 axes x1y2 w lines lw 2 lc rgbcolor "#7f5fff" title "le nombre de participants par semaine (sur y2)", \
"cov_20240103214732_00_data_activite_week.txt" u 1:4:($4-$5) axes x1y2 w filledcurves lw 2 lc rgbcolor "#9f9fff" title "le nombre de nouveaux participants par semaine (sur y2)", \
"cov_20240103214732_00_data_activite_week.txt" u 1:3 axes x1y2 w lines lw 2 lc rgbcolor "#3faf3f" title "le nombre de posts roses par semaine (sur y2)"

set output


# L'activité du topic par jour

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "cov_20240103214732_06_activite_all_day" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "cov_20240103214732_06_activite_all_day.svg"
set title "{/:Bold=18 L'activité all time par jour du topic COVID-19\n{/:Bold=14 (données collectées le mercredi 3 janvier 2024 à 21:47:32)"
set ylabel "{/=16 le nombre de posts par jour"
set y2label "{/=16 le nombre de posts roses et de participants par jour"
set key at graph .975, graph .96 top right Left opaque reverse samplen 3 box spacing 1.2 height .5 width -10
set xtics ("jan 2019" 1546300800, "jul 2019" 1561939200, "jan 2020" 1577836800, "jul 2020" 1593561600, "jan 2021" 1609459200, "jul 2021" 1625097600, "jan 2022" 1640995200, "jul 2022" 1656633600, "jan 2023" 1672531200, "jul 2023" 1688169600, "jan 2024" 1704067200, "jul 2024" 1719792000, "jan 2025" 1735689600, "jul 2025" 1751328000, "jan 2026" 1767225600) rotate
set ytics 0, 2000
set mytics 2
set y2tics 0, 200
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

plot [1576886400:1706918400][0:11000] \
"cov_20240103214732_00_data_activite_day.txt" u 1:2 w lines lw 2 lc rgbcolor "#ff7f00" title "le nombre de posts par jour", \
"cov_20240103214732_00_data_activite_day.txt" u 1:4 axes x1y2 w lines lw 2 lc rgbcolor "#7f5fff" title "le nombre de participants par jour (sur y2)", \
"cov_20240103214732_00_data_activite_day.txt" u 1:4:($4-$5) axes x1y2 w filledcurves lw 2 lc rgbcolor "#9f9fff" title "le nombre de nouveaux participants par jour (sur y2)", \
"cov_20240103214732_00_data_activite_day.txt" u 1:3 axes x1y2 w lines lw 2 lc rgbcolor "#3faf3f" title "le nombre de posts roses par jour (sur y2)"

set output

