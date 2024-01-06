

# Le nombre de posts foot vs covid

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "foo_20240104035056_41_foot_versus_covid" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "foo_20240104035056_41_foot_versus_covid.svg"
set title "{/:Bold=18 Le topic foot versus le topic COVID-19 en nombre de posts en 2023\n{/:Bold=14 (données collectées le jeudi 4 janvier 2024 à 03:50:56)"
set key at graph .025, graph .96 top left Left opaque reverse samplen 3 box spacing 1.2 height .4 width -5
set xtics ("2006" 1136073600, "2007" 1167609600, "2008" 1199145600, "2009" 1230768000, "2010" 1262304000, "2011" 1293840000, "2012" 1325376000, "2013" 1356998400, "2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200, "2025" 1735689600, "2026" 1767225600, "2027" 1798761600, "2028" 1830297600, "2029" 1861920000, "2030" 1893456000, "2031" 1924992000, "2032" 1956528000, "2033" 1988150400, "2034" 2019686400) rotate
set ytics 0, 1000000
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
reglin_foot_all(x)=afa*x+bfa
fit reglin_foot_all(x) "foo_20240104035056_00_data_count_posts_foot.txt" via afa,bfa
reglin_covid(x)=ac*x+bc
fit reglin_covid(x) "foo_20240104035056_00_data_count_posts_covid_2023.txt" via ac,bc
reglin_covid_all(x)=aca*x+bca
fit reglin_covid_all(x) "foo_20240104035056_00_data_count_posts_covid.txt" via aca,bca

x_all=(bca-bfa)/(afa-aca)
y_all=reglin_foot_all(x_all)
x_last=(bc-bf)/(af-ac)
y_last=reglin_foot(x_last)

set label 1 "tendances\nglobales" noenhanced at x_all,y_all center tc rgbcolor "#ff8f00" point ps 1 pt 7 lc rgbcolor "#ff8f00" front offset -6.5,1.4

# set label 2 "tandances\n2023" noenhanced at x_last,y_last center tc rgbcolor "#ff4f00" point ps 1 pt 7 lc rgbcolor "#ff4f00" front offset 6.5,-1

plot [1136073600:2019686400][0:5000000] \
reglin_foot_all(x) lw 1 lc rgbcolor "#00ffbf" title "tendance globale du topic foot", \
reglin_foot(x) lw 1 lc rgbcolor "#00bf7f" title "tendance 2023 du topic foot", \
"foo_20240104035056_00_data_count_posts_foot.txt" u 1:2 w line lw 2 lc rgbcolor "#007fff" title "posts all time du topic foot", \
reglin_covid_all(x) lw 1 lc rgbcolor "#ff00bf" title "tendance globale du topic COVID-19", \
reglin_covid(x) lw 1 lc rgbcolor "#bf007f" title "tendance 2023 du topic COVID-19", \
"foo_20240104035056_00_data_count_posts_covid.txt" u 1:2 w line lw 2 lc rgbcolor "#7f00ff" title "posts all time du topic COVID-19"

set output


# Le nombre de posts foot vs world

unset multiplot
reset session
reset
#set locale "french"
set encoding utf8
set terminal svg size 1920, 1080 dynamic name "foo_20240104035056_42_foot_versus_world" font "Verdana,Arial,Sans-serif,Helvetica,14" dashlength 2 linewidth 1 background "#ffffff"
set output "foo_20240104035056_42_foot_versus_world.svg"
set title "{/:Bold=18 Le topic foot versus the world en nombre de posts en 2023\n{/:Bold=14 (données collectées le jeudi 4 janvier 2024 à 03:50:56)"
set key at graph .025, graph .96 top left Left opaque reverse samplen 3 box spacing 1.2 height .4 width -8
set xtics ("2003" 1041379200, "2004" 1072915200, "2005" 1104537600, "2006" 1136073600, "2007" 1167609600, "2008" 1199145600, "2009" 1230768000, "2010" 1262304000, "2011" 1293840000, "2012" 1325376000, "2013" 1356998400, "2014" 1388534400, "2015" 1420070400, "2016" 1451606400, "2017" 1483228800, "2018" 1514764800, "2019" 1546300800, "2020" 1577836800, "2021" 1609459200, "2022" 1640995200, "2023" 1672531200, "2024" 1704067200, "2025" 1735689600, "2026" 1767225600) rotate
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

set xrange [1041379200:1767225600]
set yrange [0:3000000]

plot [1041379200:1767225600][0:3000000] \
"foo_20240104035056_00_data_count_posts_foot.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#e6194B" title "posts all time du topic foot", \
"foo_20240104035056_00_data_count_posts_gsnalf.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#ffe119" title "posts all time du topic GSNALF", \
"foo_20240104035056_00_data_count_posts_photonum.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#3cb44b" title "posts all time du bistrot photonum", \
"foo_20240104035056_00_data_count_posts_insomniaks.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#4363d8" title "posts all time du topic insomniaks", \
"foo_20240104035056_00_data_count_posts_covid.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#f58231" title "posts all time du topic COVID-19", \
"foo_20240104035056_00_data_count_posts_images.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#911eb4" title "posts all time du topic images", \
"foo_20240104035056_00_data_count_posts_ukraine.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#f032e6" title "posts all time du topic Ukraine", \
"foo_20240104035056_00_data_count_posts_zemmour.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#42d4f4" title "posts all time du topic Zemmour", \
"foo_20240104035056_00_data_count_posts_moyenorient.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#000075" title "posts all time du topic Moyen-Orient", \
"foo_20240104035056_00_data_count_posts_submersible.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#bfef45" title "posts all time du topic submersible", \
"foo_20240104035056_00_data_count_posts_foot.txt" every ::2824727::2824727 u 1:2:(bigger($2)) w labels left tc rgbcolor "#e6194B" point lc rgbcolor "#e6194B" pt 7 ps 1 offset .8,.4 notitle, \
"foo_20240104035056_00_data_count_posts_gsnalf.txt" every ::2084033::2084033 u 1:2:(bigger($2)) w labels left tc rgbcolor "#ffe119" point lc rgbcolor "#ffe119" pt 7 ps 1 offset .8,.4 notitle, \
"foo_20240104035056_00_data_count_posts_photonum.txt" every ::1887342::1887342 u 1:2:(bigger($2)) w labels left tc rgbcolor "#3cb44b" point lc rgbcolor "#3cb44b" pt 7 ps 1 offset .8,.4 notitle, \
"foo_20240104035056_00_data_count_posts_insomniaks.txt" every ::1361986::1361986 u 1:2:(bigger($2)) w labels left tc rgbcolor "#4363d8" point lc rgbcolor "#4363d8" pt 7 ps 1 offset .8,.4 notitle, \
"foo_20240104035056_00_data_count_posts_covid.txt" every ::987034::987034 u 1:2:(bigger($2)) w labels left tc rgbcolor "#f58231" point lc rgbcolor "#f58231" pt 7 ps 1 offset .8,.4 notitle, \
"foo_20240104035056_00_data_count_posts_images.txt" every ::600195::600195 u 1:2:(bigger($2)) w labels left tc rgbcolor "#911eb4" point lc rgbcolor "#911eb4" pt 7 ps 1 offset .8,.4 notitle, \
"foo_20240104035056_00_data_count_posts_ukraine.txt" every ::471895::471895 u 1:2:(bigger($2)) w labels left tc rgbcolor "#f032e6" point lc rgbcolor "#f032e6" pt 7 ps 1 offset .8,.4 notitle, \
"foo_20240104035056_00_data_count_posts_zemmour.txt" every ::271567::271567 u 1:2:(bigger($2)) w labels left tc rgbcolor "#42d4f4" point lc rgbcolor "#42d4f4" pt 7 ps 1 offset .8,.4 notitle, \
"foo_20240104035056_00_data_count_posts_moyenorient.txt" every ::164941::164941 u 1:2:(bigger($2)) w labels left tc rgbcolor "#000075" point lc rgbcolor "#000075" pt 7 ps 1 offset .8,.4 notitle, \
"foo_20240104035056_00_data_count_posts_submersible.txt" every ::3137::3137 u 1:2:(bigger($2)) w labels left tc rgbcolor "#bfef45" point lc rgbcolor "#bfef45" pt 7 ps 1 offset .8,.4 notitle

#"foo_20240104035056_00_data_count_posts_terrorisme.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#bfef45" title "posts all time du topic terrorisme", \
# "foo_20240104035056_00_data_count_posts_charlie.txt" u 1:2 smooth bezier lw 2 lc rgbcolor "#800000" title "posts all time du topic Charlie Hebdo", \

#"foo_20240104035056_00_data_count_posts_terrorisme.txt" every ::301227::301227 u 1:2:(bigger($2)) w labels left tc rgbcolor "#bfef45" point lc rgbcolor "#bfef45" pt 7 ps 1 offset .8,.4 notitle, \
# "foo_20240104035056_00_data_count_posts_charlie.txt" every ::118197::118197 u 1:2:(bigger($2)) w labels left tc rgbcolor "#800000" point lc rgbcolor "#800000" pt 7 ps 1 offset .8,.4 notitle, \

set output


