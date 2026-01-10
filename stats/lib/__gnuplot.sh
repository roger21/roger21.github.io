if ls lib_20260106102002_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! LIB" ; else echo "no lib_20260106102002_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed LIB :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/lib/lib_20260106102002_00_gnuplot.gp

sed -i "s/<title>lib_20260106102002_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2025 du topic libéral<\/title>/g" lib_20260106102002_g1_counts_all.svg
sed -i "s/<title>lib_20260106102002_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2025 du topic libéral<\/title>/g" lib_20260106102002_g2_evol_all.svg

rm lib_20260106102002_00_data_*

