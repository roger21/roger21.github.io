

# Le nombre de posts culture générale versus images

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "cul_20240104031752_12_course_image" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "cul_20240104031752_12_course_image.svg"
set title "{/:Bold=18 Le topic culture générale versus le topic images en nombre de posts en 2023\n{/:Bold=14 (données collectées le jeudi 4 janvier 2024 à 03:17:52)"
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
fit reglin_culture_generale(x) "cul_20240104031752_00_data_count_posts_culture_generale_2023.txt" via acg,bcg
reglin_images(x)=ai*x+bi
fit reglin_images(x) "cul_20240104031752_00_data_count_posts_images_2023.txt" via ai,bi

plot [1199145600:1798761600][0:800000] \
reglin_culture_generale(x) lw 1 lc rgbcolor "#00bf7f" title "tendance 2023 du topic culture générale", \
"cul_20240104031752_00_data_count_posts_culture_generale.txt" u 1:2 w line lw 2 lc rgbcolor "#007fff" title "posts all time du topic culture générale", \
reglin_images(x) lw 1 lc rgbcolor "#bf007f" title "tendance 2023 du topic images", \
"cul_20240104031752_00_data_count_posts_images.txt" u 1:2 w line lw 2 lc rgbcolor "#7f00ff" title "posts all time du topic images"

set output


# Le nombre de posts culture générale versus images zoomé

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "cul_20240104031752_13_course_image_zoom" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "cul_20240104031752_13_course_image_zoom.svg"
set title "{/:Bold=18 Le topic culture générale versus le topic images en nombre de posts zoomé en 2023\n{/:Bold=14 (données collectées le jeudi 4 janvier 2024 à 03:17:52)"
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
fit reglin_culture_generale(x) "cul_20240104031752_00_data_count_posts_culture_generale_2023.txt" via acg,bcg
reglin_images(x)=ai*x+bi
fit reglin_images(x) "cul_20240104031752_00_data_count_posts_images_2023.txt" via ai,bi

plot [1593561600:1719792000][525000:625000] \
reglin_culture_generale(x) lw 1 lc rgbcolor "#00bf7f" title "tendance 2023 du topic culture générale", \
"cul_20240104031752_00_data_count_posts_culture_generale.txt" u 1:2 w line lw 2 lc rgbcolor "#007fff" title "posts all time du topic culture générale", \
reglin_images(x) lw 1 lc rgbcolor "#bf007f" title "tendance 2023 du topic images", \
"cul_20240104031752_00_data_count_posts_images.txt" u 1:2 w line lw 2 lc rgbcolor "#7f00ff" title "posts all time du topic images"

set output


# Les babylones de mayrde all time

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "cul_20240104031752_14_babylones_mayrde" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "cul_20240104031752_14_babylones_mayrde.svg"
set title "{/:Bold=18 Le nombre all time de laurekas et de babylones de mayrde du topic culture générale en 2023\n{/:Bold=14 (données collectées le jeudi 4 janvier 2024 à 03:17:52)"
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

plot [-1:14][0:5000] \
"cul_20240104031752_00_data_count_babylones_mayrde.txt" u 3:xtic(2) lw 2 lc rgbcolor "#2ca02c" title "Laurekas", \
"cul_20240104031752_00_data_count_babylones_mayrde.txt" u 4 lw 2 lc rgbcolor "#ff7f0e" title "Babylones de mayrde", \
"cul_20240104031752_00_data_count_babylones_mayrde.txt" u 1:5 axes x1y2 w lines lw 2 lc rgbcolor "#7f00ff" title "Ratio de babylones de mayrde (sur y2)", \
"cul_20240104031752_00_data_count_babylones_mayrde.txt" u 1:($3 + $4 + 100):(boldus($3)) every ::::0 w labels center tc rgbcolor "#2ca02c" offset second -.1,0 notitle, \
"cul_20240104031752_00_data_count_babylones_mayrde.txt" u 1:($3 + $4 + 250):(boldus($4)) every ::::0 w labels center tc rgbcolor "#ff7f0e" offset second -.1,0 notitle, \
"cul_20240104031752_00_data_count_babylones_mayrde.txt" u 1:($3 + $4 + 100):(boldus($3)) every ::1 w labels center tc rgbcolor "#2ca02c" notitle, \
"cul_20240104031752_00_data_count_babylones_mayrde.txt" u 1:($3 + $4 + 250):(boldus($4)) every ::1 w labels center tc rgbcolor "#ff7f0e" notitle, \
"cul_20240104031752_00_data_count_babylones_mayrde.txt" u 1:5:(minus($5)) every ::::4 axes x1y2 w labels left tc rgbcolor "#7f00ff" point lc rgbcolor "#7f00ff" pt 7 ps .75 offset second .1,1.5 notitle, \
"cul_20240104031752_00_data_count_babylones_mayrde.txt" u 1:5:(minus($5)) every ::6::6 axes x1y2 w labels left tc rgbcolor "#7f00ff" point lc rgbcolor "#7f00ff" pt 7 ps .75 offset second .1,1.5 notitle, \
"cul_20240104031752_00_data_count_babylones_mayrde.txt" u 1:5:(minus($5)) every ::8::11 axes x1y2 w labels left tc rgbcolor "#7f00ff" point lc rgbcolor "#7f00ff" pt 7 ps .75 offset second .1,1.5 notitle, \
"cul_20240104031752_00_data_count_babylones_mayrde.txt" u 1:5:(minus($5)) every 2::5::7 axes x1y2 w labels left tc rgbcolor "#7f00ff" point lc rgbcolor "#7f00ff" pt 7 ps .75 offset second .1,-2.5 notitle, \
"cul_20240104031752_00_data_count_babylones_mayrde.txt" u 1:5:(minus($5)) every ::12::12 axes x1y2 w labels left tc rgbcolor "#7f00ff" point lc rgbcolor "#7f00ff" pt 7 ps .75 offset second .1,-2.5 notitle, \
"cul_20240104031752_00_data_count_babylones_mayrde.txt" u 1:5:(minus($5)) every ::13 axes x1y2 w labels left tc rgbcolor "#7f00ff" point lc rgbcolor "#7f00ff" pt 7 ps .75 offset second .1,1.5 notitle

set output


