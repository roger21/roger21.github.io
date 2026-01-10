

# Le nombre de posts et de participants du topic

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "cul_20260105190944_g1_counts_all" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "cul_20260105190944_g1_counts_all.svg"
set title "{/:Bold=18 Le nombre de posts et de participants all time 2025 du topic culture générale\n{/:Bold=14 (données collectées le lundi 5 janvier 2026 à 19:09:44)"
set ylabel "{/=16 le nombre de posts, de questions, de laurekas et de babylones de mayrde"
set y2label "{/=16 le nombre de posts roses et de participants"
set key at graph .025, graph .96 top left Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set xtics ("2008" 1199145600, "2009" 1230768000, "2010" 1262304000, "2011" 1293840000, "2012" 1325376000, "2013" 1356998400, "2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200, "2025" 1735689600, "2026" 1767225600, "2027" 1798761600, "2028" 1830297600, "2029" 1861920000) rotate
set ytics 0, 200000
set mytics 2
set y2tics 0, 400
set link y2 via y / 500 inverse y * 500
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

plot [1273509357:1776906311][0:682945.2] \
"cul_20260105190944_00_data_count_posts.txt" u 1:2 w line lw 2 lc rgbcolor "#003fbf" title "le nombre de posts", \
"cul_20260105190944_00_data_count_questions.txt" u 1:($2/30) axes x1y2 w line lw 2 lc rgbcolor "#ffe119" title "le nombre de questions (sur y2 x30)", \
"cul_20260105190944_00_data_count_laurekas.txt" u 1:($2/30) axes x1y2 w line lw 2 lc rgbcolor "#ff9900" title "le nombre de laurekas (sur y2 x30)", \
"cul_20260105190944_00_data_count_babylones.txt" u 1:($2/30) axes x1y2 w line lw 2 lc rgbcolor "#42d4f4" title "le nombre de babylones de mayrde (sur y2 x30)", \
"cul_20260105190944_00_data_count_participants.txt" u 1:2 axes x1y2 w line lw 2 lc rgbcolor "#109618" title "le nombre de participants (sur y2)", \
"cul_20260105190944_00_data_count_roses.txt" u 1:2 axes x1y2 w line lw 2 lc rgbcolor "#dc3912" title "le nombre de posts roses (sur y2)", \
"cul_20260105190944_00_data_count_posts.txt" every ::650424::650424 u 1:2:(bigger($2)) w labels right tc rgbcolor "#003fbf" point lc rgbcolor "#003fbf" pt 7 ps 1 offset 0,.6 notitle, \
"cul_20260105190944_00_data_count_questions.txt" every ::31801::31801 u 1:($2/30):(bigger($2)) axes x1y2 w labels right tc rgbcolor "#ffe119" point lc rgbcolor "#ffe119" pt 7 ps 1 offset 0,.6 notitle, \
"cul_20260105190944_00_data_count_laurekas.txt" every ::22857::22857 u 1:($2/30):(bigger($2)) axes x1y2 w labels right tc rgbcolor "#ff9900" point lc rgbcolor "#ff9900" pt 7 ps 1 offset 0,.6 notitle, \
"cul_20260105190944_00_data_count_babylones.txt" every ::4875::4875 u 1:($2/30):(bigger($2)) axes x1y2 w labels right tc rgbcolor "#42d4f4" point lc rgbcolor "#42d4f4" pt 7 ps 1 offset 0,.6 notitle, \
"cul_20260105190944_00_data_count_participants.txt" every ::1213::1213 u 1:2:(bigger($2)) axes x1y2 w labels right tc rgbcolor "#109618" point lc rgbcolor "#109618" pt 7 ps 1 offset 0,.6 notitle, \
"cul_20260105190944_00_data_count_roses.txt" every ::21::21 u 1:2:(bigger($2)) axes x1y2 w labels right tc rgbcolor "#dc3912" point lc rgbcolor "#dc3912" pt 7 ps 1 offset 0,.6 notitle

set output


# L'évolution du nombre de participants du topic

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "cul_20260105190944_g2_evol_all" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "cul_20260105190944_g2_evol_all.svg"
set multiplot title "{/:Bold=18 L'évolution du nombre de participants all time 2025 du topic culture générale\n{/:Bold=14 (données collectées le lundi 5 janvier 2026 à 19:09:44)"
set xtics ("2008" 1199145600, "2009" 1230768000, "2010" 1262304000, "2011" 1293840000, "2012" 1325376000, "2013" 1356998400, "2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200, "2025" 1735689600, "2026" 1767225600, "2027" 1798761600, "2028" 1830297600, "2029" 1861920000) rotate
set ytics 0, 400
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

plot [1273509357:1776906311][0:1273.65] \
"cul_20260105190944_00_data_evol.txt" u 1:2 w lines lw 2 lc rgbcolor "#003fbf" title "le nombre de premières participations", \
"cul_20260105190944_00_data_evol.txt" u 1:3 w lines lw 2 lc rgbcolor "#dc3912" title "le nombre de dernières participations", \
"cul_20260105190944_00_data_evol.txt" u 1:2:3 w filledcurves lw 2 lc rgbcolor "#983fcf" title "le nombre de participants présents   "

set ytics 0, 100
set mytics 2

set ylabel "{/=16 le nombre de participants"
set key at graph .975, graph .88 top right Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set format y "%'4.0f"

set size .985,.35 # x + k
set origin .015,0

plot [1273509357:1776906311][0:251.9] \
"cul_20260105190944_00_data_evol.txt" u 1:4 smooth bezier lw 2 lc rgbcolor "#983fcf" title "le nombre de participants présents   "

unset multiplot
set output


# Le nombre de posts culture générale versus images

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "cul_20260105190944_g3_course_image" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "cul_20260105190944_g3_course_image.svg"
set title "{/:Bold=18 Le topic culture générale versus le topic images en nombre de posts en 2025\n{/:Bold=14 (données collectées le lundi 5 janvier 2026 à 19:09:44)"
set ylabel "{/=16 le nombre de posts"
set key at graph .025, graph .96 top left Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set xtics ("2008" 1199145600, "2009" 1230768000, "2010" 1262304000, "2011" 1293840000, "2012" 1325376000, "2013" 1356998400, "2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200, "2025" 1735689600, "2026" 1767225600, "2027" 1798761600) rotate
set ytics 0, 100000
set mytics 2
set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
set format y "%'.0f"
set xdata time
set timefmt "%s"
set format x "%F %T"
set mouse mouseformat "DateTime"

set size .985,1
set origin .015,0

set fit quiet nolog limit 1e-30
reglin_culture_generale(x)=acg*x+bcg
fit reglin_culture_generale(x) "cul_20260105190944_00_data_count_posts_culture_generale_2025.txt" via acg,bcg
reglin_images(x)=ai*x+bi
fit reglin_images(x) "cul_20260105190944_00_data_count_posts_images_2025.txt" via ai,bi

plot [1199145600:1798761600][0:700000] \
"cul_20260105190944_00_data_count_posts_culture_generale.txt" u 1:2 w line lw 2 lc rgbcolor "#911eb4" title "posts all time du topic culture générale", \
reglin_culture_generale(x) lw 1 lc rgbcolor "#dcbeff" title "tendance 2025 du topic culture générale", \
"cul_20260105190944_00_data_count_posts_images.txt" u 1:2 w line lw 2 lc rgbcolor "#3cb44b" title "posts all time du topic images", \
reglin_images(x) lw 1 lc rgbcolor "#aaffc3" title "tendance 2025 du topic images"

set output


# Le nombre de posts culture générale versus images zoomé

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "cul_20260105190944_g4_course_image_zoom" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "cul_20260105190944_g4_course_image_zoom.svg"
set title "{/:Bold=18 Le topic culture générale versus le topic images en nombre de posts zoomé en 2025\n{/:Bold=14 (données collectées le lundi 5 janvier 2026 à 19:09:44)"
set ylabel "{/=16 le nombre de posts"
set key at graph .025, graph .96 top left Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set xtics ("2008" 1199145600, "2009" 1230768000, "2010" 1262304000, "2011" 1293840000, "2012" 1325376000, "2013" 1356998400, "2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200, "2025" 1735689600, "2026" 1767225600, "2027" 1798761600) rotate
set ytics 0, 50000
set mytics 2
set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
set format y "%'.0f"
set xdata time
set timefmt "%s"
set format x "%F %T"
set mouse mouseformat "DateTime"

set size .985,1
set origin .015,0

set fit quiet nolog limit 1e-30
reglin_culture_generale(x)=acg*x+bcg
fit reglin_culture_generale(x) "cul_20260105190944_00_data_count_posts_culture_generale_2025.txt" via acg,bcg
reglin_images(x)=ai*x+bi
fit reglin_images(x) "cul_20260105190944_00_data_count_posts_images_2025.txt" via ai,bi

plot [1577836800:1782864000][525000:675000] \
"cul_20260105190944_00_data_count_posts_culture_generale.txt" u 1:2 w line lw 2 lc rgbcolor "#911eb4" title "posts all time du topic culture générale", \
reglin_culture_generale(x) lw 1 lc rgbcolor "#dcbeff" title "tendance 2025 du topic culture générale", \
"cul_20260105190944_00_data_count_posts_images.txt" u 1:2 w line lw 2 lc rgbcolor "#3cb44b" title "posts all time du topic images", \
reglin_images(x) lw 1 lc rgbcolor "#aaffc3" title "tendance 2025 du topic images"

set output


# Les babylones de mayrde all time

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "cul_20260105190944_g5_babylones_mayrde" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "cul_20260105190944_g5_babylones_mayrde.svg"
set title "{/:Bold=18 Le nombre all time de laurekas et de babylones de mayrde du topic culture générale en 2025\n{/:Bold=14 (données collectées le lundi 5 janvier 2026 à 19:09:44)"
set ylabel "{/=16 le nombre de laurekas et de babylones de mayrde"
set y2label "{/=16 le ratio de babylones de mayrde (en %)"
set key at graph .975, graph .96 top right Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set style data histogram
set style histogram rowstacked
set ytics 0, 1000
set mytics 2
set y2tics 0, 20
set link y2 via y / 50 inverse y * 50
set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
set style fill transparent solid .4
set boxwidth 0.75

boldus(s) = sprintf("{/:Bold=14 %.f}", s)
minus(s) = sprintf("{/:Bold=14 %.2f %}", s)

set size .985,1
set origin .015,0

plot [-1:16][0:5000] \
"cul_20260105190944_00_data_count_babylones_mayrde.txt" u 3:xtic(2) lw 2 lc rgbcolor "#2ca02c" title "Laurekas", \
"cul_20260105190944_00_data_count_babylones_mayrde.txt" u 4 lw 2 lc rgbcolor "#ff7f0e" title "Babylones de mayrde", \
"cul_20260105190944_00_data_count_babylones_mayrde.txt" u 1:5 axes x1y2 w lines lw 2 lc rgbcolor "#9030d0" title "Ratio de babylones de mayrde (sur y2)", \
"cul_20260105190944_00_data_count_babylones_mayrde.txt" u 1:($3 + $4 + 100):(boldus($3)) every ::::0 w labels center tc rgbcolor "#2ca02c" offset second -.1,0 notitle, \
"cul_20260105190944_00_data_count_babylones_mayrde.txt" u 1:($3 + $4 + 250):(boldus($4)) every ::::0 w labels center tc rgbcolor "#ff7f0e" offset second -.1,0 notitle, \
"cul_20260105190944_00_data_count_babylones_mayrde.txt" u 1:($3 + $4 + 100):(boldus($3)) every ::1 w labels center tc rgbcolor "#2ca02c" notitle, \
"cul_20260105190944_00_data_count_babylones_mayrde.txt" u 1:($3 + $4 + 250):(boldus($4)) every ::1 w labels center tc rgbcolor "#ff7f0e" notitle, \
"cul_20260105190944_00_data_count_babylones_mayrde.txt" u 1:5:(minus($5)) every ::::3 axes x1y2 w labels left tc rgbcolor "#9030d0" point lc rgbcolor "#9030d0" pt 7 ps .75 offset second .05,1 notitle, \
"cul_20260105190944_00_data_count_babylones_mayrde.txt" u 1:5:(minus($5)) every ::4::5 axes x1y2 w labels left tc rgbcolor "#9030d0" point lc rgbcolor "#9030d0" pt 7 ps .75 offset second .05,-2 notitle, \
"cul_20260105190944_00_data_count_babylones_mayrde.txt" u 1:5:(minus($5)) every ::6::6 axes x1y2 w labels left tc rgbcolor "#9030d0" point lc rgbcolor "#9030d0" pt 7 ps .75 offset second .05,1 notitle, \
"cul_20260105190944_00_data_count_babylones_mayrde.txt" u 1:5:(minus($5)) every ::7::7 axes x1y2 w labels left tc rgbcolor "#9030d0" point lc rgbcolor "#9030d0" pt 7 ps .75 offset second .05,-2 notitle, \
"cul_20260105190944_00_data_count_babylones_mayrde.txt" u 1:5:(minus($5)) every ::8::11 axes x1y2 w labels left tc rgbcolor "#9030d0" point lc rgbcolor "#9030d0" pt 7 ps .75 offset second .05,1 notitle, \
"cul_20260105190944_00_data_count_babylones_mayrde.txt" u 1:5:(minus($5)) every ::12::12 axes x1y2 w labels left tc rgbcolor "#9030d0" point lc rgbcolor "#9030d0" pt 7 ps .75 offset second .05,-2 notitle, \
"cul_20260105190944_00_data_count_babylones_mayrde.txt" u 1:5:(minus($5)) every ::13 axes x1y2 w labels left tc rgbcolor "#9030d0" point lc rgbcolor "#9030d0" pt 7 ps .75 offset second .05,1 notitle

set output


