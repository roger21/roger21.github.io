

# Le nombre de posts et de participants du topic

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "foo_20240104035056_g1_counts_all" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "foo_20240104035056_g1_counts_all.svg"
set title "{/:Bold=18 Le nombre de posts et de participants all time 2023 du topic foot\n{/:Bold=14 (données collectées le jeudi 4 janvier 2024 à 03:50:56)"
set ylabel "{/=16 le nombre de posts et de smileys"
set y2label "{/=16 le nombre de posts roses et de participants"
set key at graph .025, graph .96 top left Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set xtics ("2004" 1072915200, "2005" 1104537600, "2006" 1136073600, "2007" 1167609600, "2008" 1199145600, "2009" 1230768000, "2010" 1262304000, "2011" 1293840000, "2012" 1325376000, "2013" 1356998400, "2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200, "2025" 1735689600, "2026" 1767225600, "2027" 1798761600) rotate
set ytics 0, 500000
set mytics 2
set y2tics 0, 1000
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

plot [1141605174:1715095868][0:2965964.4] \
"foo_20240104035056_00_data_count_posts.txt" u 1:2 w line lw 2 lc rgbcolor "#003fbf" title "le nombre de posts", \
"foo_20240104035056_00_data_count_smileys.txt" u 1:2 w line lw 2 lc rgbcolor "#ff9900" title "le nombre de smileys", \
"foo_20240104035056_00_data_count_participants.txt" u 1:2 axes x1y2 w line lw 2 lc rgbcolor "#109618" title "le nombre de participants (sur y2)", \
"foo_20240104035056_00_data_count_roses.txt" u 1:2 axes x1y2 w line lw 2 lc rgbcolor "#dc3912" title "le nombre de posts roses (sur y2)", \
"foo_20240104035056_00_data_count_posts.txt" every ::2824728::2824728 u 1:2:(bigger($2)) w labels right tc rgbcolor "#003fbf" point lc rgbcolor "#003fbf" pt 7 ps 1 offset 0,.6 notitle, \
"foo_20240104035056_00_data_count_smileys.txt" every ::1442480::1442480 u 1:2:(bigger($2)) w labels right tc rgbcolor "#ff9900" point lc rgbcolor "#ff9900" pt 7 ps 1 offset 0,.6 notitle, \
"foo_20240104035056_00_data_count_participants.txt" every ::4724::4724 u 1:2:(bigger($2)) axes x1y2 w labels right tc rgbcolor "#109618" point lc rgbcolor "#109618" pt 7 ps 1 offset 0,.6 notitle, \
"foo_20240104035056_00_data_count_roses.txt" every ::1237::1237 u 1:2:(bigger($2)) axes x1y2 w labels right tc rgbcolor "#dc3912" point lc rgbcolor "#dc3912" pt 7 ps 1 offset 0,.6 notitle

set output


# L'évolution du nombre de participants du topic

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "foo_20240104035056_g2_evol_all" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "foo_20240104035056_g2_evol_all.svg"
set multiplot title "{/:Bold=18 L'évolution du nombre de participants all time 2023 du topic foot\n{/:Bold=14 (données collectées le jeudi 4 janvier 2024 à 03:50:56)"
set xtics ("2004" 1072915200, "2005" 1104537600, "2006" 1136073600, "2007" 1167609600, "2008" 1199145600, "2009" 1230768000, "2010" 1262304000, "2011" 1293840000, "2012" 1325376000, "2013" 1356998400, "2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200, "2025" 1735689600, "2026" 1767225600, "2027" 1798761600) rotate
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

plot [1141605174:1715095868][0:4960.2] \
"foo_20240104035056_00_data_evol.txt" u 1:2 w lines lw 2 lc rgbcolor "#003fbf" title "le nombre de premières participations", \
"foo_20240104035056_00_data_evol.txt" u 1:3 w lines lw 2 lc rgbcolor "#dc3912" title "le nombre de dernières participations", \
"foo_20240104035056_00_data_evol.txt" u 1:2:3 w filledcurves lw 2 lc rgbcolor "#983fcf" title "le nombre de participants présents   "

set ytics 0, 500
set mytics 2

set ylabel "{/=16 le nombre de participants"
set key at graph .975, graph .88 top right Left opaque reverse samplen 3 box spacing 1.2 height .4 width -7
set format y "%'4.0f"

set size .985,.35 # x + k
set origin .015,0

plot [1141605174:1715095868][0:1228.7] \
"foo_20240104035056_00_data_evol.txt" u 1:4 smooth bezier lw 2 lc rgbcolor "#983fcf" title "le nombre de participants présents   "

unset multiplot
set output


# Le nombre de posts du topic vs le nombre de posts du covid

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "foo_20240104035056_g3_foot_versus_covid" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "foo_20240104035056_g3_foot_versus_covid.svg"
set title "{/:Bold=18 Le topic foot versus le topic COVID-19 en nombre de posts en 2023\n{/:Bold=14 (données collectées le jeudi 4 janvier 2024 à 03:50:56)"
set ylabel "{/=16 le nombre de posts"
set key at graph .025, graph .96 top left Left opaque reverse samplen 3 box spacing 1.2 height .4 width -5
set xtics ("2006" 1136073600, "2007" 1167609600, "2008" 1199145600, "2009" 1230768000, "2010" 1262304000, "2011" 1293840000, "2012" 1325376000, "2013" 1356998400, "2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200, "2025" 1735689600) rotate
set ytics 0, 500000
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
reglin_foot(x)=af*x+bf
fit reglin_foot(x) "foo_20240104035056_00_data_count_posts_foot_2023.txt" via af,bf
#reglin_foot_all(x)=afa*x+bfa
#fit reglin_foot_all(x) "foo_20240104035056_00_data_count_posts_foot.txt" via afa,bfa
reglin_covid(x)=ac*x+bc
fit reglin_covid(x) "foo_20240104035056_00_data_count_posts_covid_2023.txt" via ac,bc
#reglin_covid_all(x)=aca*x+bca
#fit reglin_covid_all(x) "foo_20240104035056_00_data_count_posts_covid.txt" via aca,bca

#x_all=(bca-bfa)/(afa-aca)
#y_all=reglin_foot_all(x_all)
#x_last=(bc-bf)/(af-ac)
#y_last=reglin_foot(x_last)

#set label 1 "tendances\nglobales" noenhanced at x_all,y_all center tc rgbcolor "#ff8f00" point ps 1 pt 7 lc rgbcolor "#ff8f00" front offset -6.5,1.4

#set label 2 "tandances\n2023" noenhanced at x_last,y_last center tc rgbcolor "#ff4f00" point ps 1 pt 7 lc rgbcolor "#ff4f00" front offset 6.5,-1

plot [1136073600:1735689600][0:3000000] \
"foo_20240104035056_00_data_count_posts_foot.txt" u 1:2 w line lw 2 lc rgbcolor "#f58231" title "posts all time du topic foot", \
reglin_foot(x) lw 1 lc rgbcolor "#ffd8b1" title "tendance 2023 du topic foot", \
"foo_20240104035056_00_data_count_posts_covid.txt" u 1:2 w line lw 2 lc rgbcolor "#3cb44b" title "posts all time du topic COVID-19", \
reglin_covid(x) lw 1 lc rgbcolor "#aaffc3" title "tendance 2023 du topic COVID-19"

#reglin_foot_all(x) lw 1 lc rgbcolor "#00ffbf" title "tendance globale du topic foot", \
#reglin_covid_all(x) lw 1 lc rgbcolor "#ff00bf" title "tendance globale du topic COVID-19", \

set output


# Le nombre de posts du topic vs le nombre de posts des autres topics

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "foo_20240104035056_g4_foot_versus_world" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "foo_20240104035056_g4_foot_versus_world.svg"
set title "{/:Bold=18 Le topic foot versus the world en nombre de posts en 2023\n{/:Bold=14 (données collectées le jeudi 4 janvier 2024 à 03:50:56)"
set ylabel "{/=16 le nombre de posts"
set key at graph .025, graph .96 top left Left opaque reverse samplen 3 box spacing 1.2 height .4 width -8
set xtics ("2003" 1041379200, "2004" 1072915200, "2005" 1104537600, "2006" 1136073600, "2007" 1167609600, "2008" 1199145600, "2009" 1230768000, "2010" 1262304000, "2011" 1293840000, "2012" 1325376000, "2013" 1356998400, "2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200, "2025" 1735689600) rotate
set ytics 0, 500000
set mytics 2
set grid xtics mxtics ytics mytics back lc "#3f3f3f", lc "#9f9f9f"
set format y "%'.0f"
set xdata time
set timefmt "%s"
set format x "%F %T"
set mouse mouseformat "DateTime"

set size .985,1
set origin .015,0

bigger(s) = sprintf("{/:Bold=16 %.f", s)

plot [1041379200:1751328000][0:3000000] \
"foo_20240104035056_00_data_count_posts_foot.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#e6194b" title "posts all time du topic foot", \
"foo_20240104035056_00_data_count_posts_gsnalf.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#3cb44b" title "posts all time du topic GSNALF", \
"foo_20240104035056_00_data_count_posts_photonum.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#ffe119" title "posts all time du bistrot photonum", \
"foo_20240104035056_00_data_count_posts_insomniaks.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#4363d8" title "posts all time du topic insomniaks", \
"foo_20240104035056_00_data_count_posts_covid.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#f58231" title "posts all time du topic COVID-19", \
"foo_20240104035056_00_data_count_posts_images.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#911eb4" title "posts all time du topic images", \
"foo_20240104035056_00_data_count_posts_ukraine.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#42d4f4" title "posts all time du topic Ukraine", \
"foo_20240104035056_00_data_count_posts_zemmour.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#f032e6" title "posts all time du topic Zemmour", \
"foo_20240104035056_00_data_count_posts_moyenorient.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#bfef45" title "posts all time du topic Moyen-Orient", \
"foo_20240104035056_00_data_count_posts_submersible.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#fabed4" title "posts all time du topic submersible", \
"foo_20240104035056_00_data_count_posts_foot.txt" every ::2824728::2824728 u 1:2:(bigger($2)) w labels left tc rgbcolor "#e6194b" point lc rgbcolor "#e6194b" pt 7 ps 1 offset .8,.4 notitle, \
"foo_20240104035056_00_data_count_posts_gsnalf.txt" every ::2084034::2084034 u 1:2:(bigger($2)) w labels left tc rgbcolor "#3cb44b" point lc rgbcolor "#3cb44b" pt 7 ps 1 offset .8,.4 notitle, \
"foo_20240104035056_00_data_count_posts_photonum.txt" every ::1887343::1887343 u 1:2:(bigger($2)) w labels left tc rgbcolor "#ffe119" point lc rgbcolor "#ffe119" pt 7 ps 1 offset .8,.4 notitle, \
"foo_20240104035056_00_data_count_posts_insomniaks.txt" every ::1361987::1361987 u 1:2:(bigger($2)) w labels left tc rgbcolor "#4363d8" point lc rgbcolor "#4363d8" pt 7 ps 1 offset .8,.4 notitle, \
"foo_20240104035056_00_data_count_posts_covid.txt" every ::987012::987012 u 1:2:(bigger($2)) w labels left tc rgbcolor "#f58231" point lc rgbcolor "#f58231" pt 7 ps 1 offset .8,.4 notitle, \
"foo_20240104035056_00_data_count_posts_images.txt" every ::600196::600196 u 1:2:(bigger($2)) w labels left tc rgbcolor "#911eb4" point lc rgbcolor "#911eb4" pt 7 ps 1 offset .8,.4 notitle, \
"foo_20240104035056_00_data_count_posts_ukraine.txt" every ::471032::471032 u 1:2:(bigger($2)) w labels left tc rgbcolor "#42d4f4" point lc rgbcolor "#42d4f4" pt 7 ps 1 offset .8,.4 notitle, \
"foo_20240104035056_00_data_count_posts_zemmour.txt" every ::271339::271339 u 1:2:(bigger($2)) w labels left tc rgbcolor "#f032e6" point lc rgbcolor "#f032e6" pt 7 ps 1 offset .8,.4 notitle, \
"foo_20240104035056_00_data_count_posts_moyenorient.txt" every ::164942::164942 u 1:2:(bigger($2)) w labels left tc rgbcolor "#bfef45" point lc rgbcolor "#bfef45" pt 7 ps 1 offset .8,.4 notitle, \
"foo_20240104035056_00_data_count_posts_submersible.txt" every ::3138::3138 u 1:2:(bigger($2)) w labels left tc rgbcolor "#fabed4" point lc rgbcolor "#fabed4" pt 7 ps 1 offset .8,.4 notitle

set output


