if ls sub2_20240104124300_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! SUB2" ; else echo "no sub2_20240104124300_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed SUB2 :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/sub/sub2_20240104124300_00_gnuplot.gp

sed -i "s/<title>sub2_20240104124300_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2023 du topic submersible disparu<\/title>/g" sub2_20240104124300_g1_counts_all.svg
sed -i "s/<title>sub2_20240104124300_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2023 du topic submersible disparu<\/title>/g" sub2_20240104124300_g2_evol_all.svg

rm sub2_20240104124300_00_data_*
