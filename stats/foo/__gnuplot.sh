if ls foo_20240104035056_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! FOO" ; else echo "no foo_20240104035056_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed FOO :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/foo/foo_20240104035056_00_gnuplot.gp

sed -i "s/<title>foo_20240104035056_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2023 du topic foot<\/title>/g" foo_20240104035056_g1_counts_all.svg
sed -i "s/<title>foo_20240104035056_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2023 du topic foot<\/title>/g" foo_20240104035056_g2_evol_all.svg
sed -i "s/<title>foo_20240104035056_g3_foot_versus_covid<\/title>/<title>Le topic foot versus le topic COVID-19 en nombre de posts en 2023<\/title>/g" foo_20240104035056_g3_foot_versus_covid.svg
sed -i "s/<title>foo_20240104035056_g4_foot_versus_world<\/title>/<title>Le topic foot versus the world en nombre de posts en 2023<\/title>/g" foo_20240104035056_g4_foot_versus_world.svg

rm foo_20240104035056_00_data_*

