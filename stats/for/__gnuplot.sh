if ls for_20260106011215_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! FOR" ; else echo "no for_20260106011215_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed FOR :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/for/for_20260106011215_00_gnuplot.gp

sed -i "s/<title>for_20260106011215_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2025 du topic du forum<\/title>/g" for_20260106011215_g1_counts_all.svg
sed -i "s/<title>for_20260106011215_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2025 du topic du forum<\/title>/g" for_20260106011215_g2_evol_all.svg

rm for_20260106011215_00_data_*

